class PasswordResetController < ApplicationController
	include SessionsHelper
	before_action :get_user, only: [:edit, :update]
	before_action :valid_user, only: [:edit, :update]
	before_action :check_expiration, only: [:edit, :update]    # Case (1)
    


	def new
	end

	def create
		@user = User.find_by(email: params[:password_reset][:email].downcase)
		if @user
			@user.create_reset_digest
			
			#UserMailer.password_reset(@user).deliver_now
			redirect_to new_password_reset_path, notice: "An email to reset your password has been sent"
		else
			
			redirect_to new_password_reset_path, notice: "Email not found"
		end
	end

	def edit
		  
	end

	def update
		 if params[:user][:password].empty? 
			@user.errors.add(:password, "can't be empty")
		    render 'edit'
		elsif @user.update_attributes(user_params)          # Case (4)
			user_log_in @user
			redirect_to @user, notice: "Password has been reset"
		else
		render 'edit'                                     # Case (2)
		end
	end


	private

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
    	@user = User.find_by(email: params[:email])
      unless (@user.authenticated?(:reset, params[:id]))      
        redirect_to root_url
      end
    end

	def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end



    # Checks expiration of reset token.
	def check_expiration
	  if @user.password_reset_expired?
	    redirect_to new_password_reset_url, notice: "Password reset has expired."
	  end
	end



end
