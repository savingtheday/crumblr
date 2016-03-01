class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "success"
      redirect_to user_path @user
    else
      flash[:alert] = "Didn't work"
      redirect_to 'user/new' #did this work?
    end
  end
def show
  @user = User.find(params[:id])
end

end
