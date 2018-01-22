class UsersController < ApplicationController

	include SessionsHelper

	before_action :only_see_own_page, only: :show unless :admin?

	before_action :keep_Users_out_of_index, only: :index

	def index
		@users = User.all.order('created_at DESC')
	end


	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		

		if @user.save!
      		flash.now[:info] = "Success"
      		redirect_to @user
		else
			render 'new'
		end
	end


	def show
		@user = User.find(params[:id])
	
	end

private

	def User_params
		params.require(:User).permit(:title, :first_name, :last_name, :email, :telephone, :mobile, 
									:home_province, :organisation, :position,
									:title, :current_campus, :future_campus,
									:description )

									

		 t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.decimal "telephone"
    t.decimal "mobile"
    t.string "home_province"
    t.string "organisation"
    t.string "position"
    t.string "title"
    t.string "current_campus"
    t.string "future_campus"
    t.string "description"
	end



	def admin?
		admin_logged_in?
	end

	def only_see_own_page
	@user = User.find(params[:id])
	  if current_User != @user 
	    redirect_to User_path(current_User.id)
	  end
	end

	def keep_Users_out_of_index
		if user_logged_in?
			redirect_to user_path(current_user.id)
		end
	end

end
