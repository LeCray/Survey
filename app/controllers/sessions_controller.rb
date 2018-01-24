class SessionsController < ApplicationController
	include SessionsHelper
  
	def new
	end

	def create	
		user = User.find_by(email: params[:session][:email])

		if user && user.authenticate(params[:session][:password])
			user_log_in user
			redirect_to users_path
		else
			redirect_to login_path , notice: "Incorrect Combination"	
		end
	end

	def destroy
    	user_log_out	
    	redirect_to root_url    
	 end

end


