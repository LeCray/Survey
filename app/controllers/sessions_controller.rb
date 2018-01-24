class SessionsController < ApplicationController
	include SessionsHelper
  
	def new
	end

	def create	
		user = User.find_by(email: params[:session][:email])

		if user.activated == true 
			if user && user.authenticate(params[:session][:password]) 
				log_in user
				redirect_to users_path
			else
				redirect_to login_path , notice: "Incorrect Combination"	
			end
		else
			redirect_to login_path, notice: "Check your emails to verify your account"
		end
	end

	def destroy
    	log_out	
    	redirect_to root_url    
	 end

end


