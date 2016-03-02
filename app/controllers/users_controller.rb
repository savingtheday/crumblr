class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "success"
      redirect_to user_path @user
    else
      flash[:alert] = "Username already taken."
      redirect_to 'user/new' #did this work?
    end
  end
  def show
    @user = get_user
  end

  def update
    @user = get_user
    @user_update = @user.update(params[:user])
    if @user_update
        flash[:notice] = "success"
        redirect_to user_path @user
      else
        flash[:alert] = "Didn't work"
        redirect_to user_path @user #did this work?
      end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "User deleted."
    redirect_to user_path
  end

  def edit
    @user = get_user
  end



  def get_user
    User.find(params[:id])
  end

end


