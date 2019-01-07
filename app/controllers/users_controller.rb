class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def createlogin
    @user = User.find_by(email: params[:user][:email])
    if !@user.nil? && @user.password == params[:user][:password]
      session[:user] = @user
      redirect_to '/bookings/new'
    else
      flash[:error] = "User id or password are incorrect. Please try again"
      render '/users/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        redirect_to '/'
      else
        render'/users/new'
      end
    else
      flash[:error] = "Passwords not matching"
      redirect_to '/users/new'
    end
  end

  def show
    redirect_to '/bookings/new'
  end

private
  def user_params
      params.require(:user).permit(:name, :email, :password)
  end

end
