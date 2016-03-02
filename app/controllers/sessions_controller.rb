class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(name: params[:name])
			if @user and @user.password == params[:password]
				session[:user_id] = @user.user_id
				flash[:notice] = "Logged In"
				redirect_to @user
			else
				flash[:alert] = "Nope, Incorrect"
				render :new
			end
		end

		def destroy
			session[:user_id] = nil
			flash[:notice] = "Logged Out"
			redirect_to root_path

		end
end


