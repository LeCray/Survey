class UserMailer < ApplicationMailer

	def account_activation(user)
	    @user = user
	    mail to: user.email, subject: "SHGAC Account Verification"
  	end

  	def user_password_reset(user)
	    @user = user
	    mail to: user.email, subject: "SHGAC Password reset"
	end

end
