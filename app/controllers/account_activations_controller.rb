class AccountActivationsController < ApplicationController

	def edit
		user = User.find_by(email: params[:email])
			if user && !user.activated? && user.authenticated?(:activation, params[:id])
				user.activate
				log_in user
				flash[:success] = "Account activated!"
				redirect_to store_url
			else
				flash[:danger] = "Invalid activation link"
				redirect_to store_url
			end
		end

end


#comments
=begin

User model: 
	def activate
		update_attribute(:activated, true)
		update_attribute(:activated_at, Time.zone.now)
	end

	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil? #nothing happens if users log out already, log out function, nil the remember_digest
		BCrypt::Password.new(digest).is_password?(token)
	end

the .activated? is migration of user where 'activated' is boolean
the 'bang' at !user is to change it into string conditional of boolean, prevent activation of user accidentally

=end

