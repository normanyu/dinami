class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(new_params)
    if @user.save
      flash[:success] = "Welcome to Dinami!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private 
  def new_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end