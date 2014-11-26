class UserController < ApplicationController
    layout 'homepage'
	# before_action :check_pass!, :except=>:logout

	def logout
		sign_out :pass
		session[:user_id] = nil
		redirect_to :root
	end

	def user_sign_in
		params = user_params
		@user = User.find_by :email => params[:email]
		
		if @user
			if @user.valid_password?(params[:password])
				sign_in :pass, @user.pass
				session[:user_id] = @user.id
				redirect_to :photos_path and return
			else
				flash[:notice] = "Invalid password"	
			end	
		else
			flash[:notice] = "Invalid email or password"

		end
		@user = User.new :email => params[:email]

		render 'signIn'
	end

	def signUp
		@user = User.new
	end

	def signIn
		if !@user
			@user = User.new
		end
	end

	def create
		params = user_params

		@user = User.new user_params

		if @user.save
			flash[:notice] = "Get Started on pixhub Upload a picture now..."
			sign_in :pass, @user.pass
			redirect_to :photos_path and return
		else
			flash[:alert] = "Error occured #{@user.errors.messages}"
		end
		render 'signUp'
	end

	private

	def user_params
		allow = [:first_name, :last_name, :email, :username, :password, :password_confirmation]
		params.require(:user).permit(allow)
	end
end
