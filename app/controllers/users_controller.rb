class UsersController < ApplicationController

	include SessionsHelper

	before_action :only_see_own_page, only: :show unless :admin?

	before_action :keep_users_out_of_index, only: :index

	def index
		@users = User.all.order('created_at DESC')
	end


	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		

		if @user.save!
      		UserMailer.account_activation(@user).deliver_now
      		redirect_to new_user_path, notice: "Please check your emails to verify your account"	
		else
			render 'new'
		end
	end


	def show
		@user = User.find(params[:id])
	
	end

private

	def user_params
		params.require(:user).permit(:title, :first_name, :last_name, :email, :telephone, :mobile, 
									:home_province, :organisation, :position,
									:current_campus, :future_campus,
									:description, :password, :password_confirmation, )
	end



	def admin?
		admin_logged_in?
	end

	def only_see_own_page
	@user = User.find(params[:id])
	  if current_user != @user 
	    redirect_to User_path(current_User.id)
	  end
	end

	def keep_users_out_of_index
		if !current_user.nil?
			redirect_to user_path(current_user.id)
		end
	end

end
