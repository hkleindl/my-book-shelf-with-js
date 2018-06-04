class SessionsController < ApplicationController

  def new
    @user = User.new
    binding.pry
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(:password)
      login(@user)
      redirect_to @user
      flash[:success] = "Welcome Back, #{current_user.username}!"
    else
      flash[:notice] = "Invalid email/password combination"
      redirect_to root_path  
    end
  end
end
