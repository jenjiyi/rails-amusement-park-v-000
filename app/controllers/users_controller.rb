class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
     @user = User.find_by(id: params[:id])
     @user.update(user_params)
     redirect_to user_path(@user), :notice => "Successfully updated user."
  end


  def destroy
    session.delete :user_id
    redirect_to :root
  end



  private
   def user_params
       params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password)
     end

end
