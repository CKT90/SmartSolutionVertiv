class Admin::ConfigsController < Admin::BaseController
  
  def index
    @search = Config.search(params[:q])
    @configs = @search.result.paginate(:page => params[:page], :per_page => 50).order('updated_at DESC')
 	respond_to do |format|
 		format.html
 		format.csv { send_data @configs.to_csv}
 		format.xls { send_data @configs.to_csv(col_sep: "\t")}

 	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  	   flash[:success] = "Profile updated"
	   redirect_to :back
  	else
  	   flash[:danger] = "Name can't be empty. / Contact Number only accept number characters." 
  	   redirect_to :back
  	end
  end

  	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end
  
private

 	 def user_params
		params.require(:user).permit(:name, :email, :contact_number, :company, :password, :password_confirmation)
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


	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

end
