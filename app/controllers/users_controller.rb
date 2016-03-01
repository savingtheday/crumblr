class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    # if @user.save
    #   flash[:notice] = "success"
  end


end
