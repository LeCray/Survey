class AccountActivationsController < ApplicationController
	include SessionsHelper	

	def edit
		user = User.find_by(email: params[:email])
		if user && (!user.activated? || user.activated.nil?) 
			user.update_attribute(:activated, true)
			user.update_attribute(:activated_at, Time.zone.now)																																																																																																																																		
			log_in user
			redirect_to users_path, notice: "Your account is now active."
		else
		
		redirect_to new_user_path, notice: "Invalid activation link"
		end
	end


end
