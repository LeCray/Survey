class User < ApplicationRecord

	attr_accessor :reset_token, :activation_token, :resent_sent_at

	has_secure_password

	validates :title, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :home_province, presence: true
	validates :position, presence: true

	TITLES = ["Mr","Ms", "Mrs", "Dr", "Pr"]
	POSITIONS = ["Education Administrator","Current Student", "Aspiring Student", "Educator",
					"Parent", "Property Owner", "Other"]

	# Sets the password reset attributes.
	def create_reset_digest
		self.reset_token = User.new_token
		update_attribute(:reset_digest,  User.digest(reset_token))
		update_attribute(:reset_sent_at, Time.zone.now)
	end

	# Sends password reset email.
	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now	
	end

	 # Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end
	
	  # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

    # Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                          BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# Returns true if a password reset has expired.
	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end

end
