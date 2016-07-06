class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all

  end

  def create
    @user = User.find(params[:user][:id])
     return head(:forbidden) unless @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
     redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to :root
  end
end
