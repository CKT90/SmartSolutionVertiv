class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy] #without logging in, user cannot access 'edit' via URL
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy
 

  def edit
  end

  def update
  	 if @user.update_attributes(secret_params)
      flash[:success] = "Passcode updated!"
      redirect_to configure_url
    else
       render :edit 
    end
  end

  
private

 	 def user_params
		params.require(:user).permit(:name, :email, :contact_number, :company, :password, :password_confirmation)
 	 end

 	 def secret_params
		params.require(:user).permit(:password, :password_confirmation)
 	 end

	# Before filters
	# Confirms a logged-in user.
	def logged_in_user #used above, for before_action
		unless logged_in?
			store_location
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end

	# Confirms the correct user.
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end


	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

end
