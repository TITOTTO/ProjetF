class UserController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
    redirect_to user_path(@user)
  end

end
