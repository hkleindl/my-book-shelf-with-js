class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(:password)
      login(@user)
      redirect_to @user
      flash[:success] = "Welcome Back, #{current_user.username}!"
    else
      render 'static_pages/home'
    end
  end
end
