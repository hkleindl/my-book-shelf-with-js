class SessionsController < ApplicationController

  # skip_before_action :logged_in_user

  def new
    @user = User.new
    binding.pry
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      login(user)
      redirect_to user_path(user)
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        login(@user)
        redirect_to @user
        flash[:success] = "Welcome Back, #{current_user.username}!"
      else
        flash[:notice] = "Invalid email/password combination"
        redirect_to root_path  
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
