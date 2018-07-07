class UsersController < ApplicationController

  skip_before_action :logged_in_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      binding.pry
      login(@user)
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to @user
    else
      render :new    
    end
  end

  def show
    if params[:id].to_i == current_user.id
      @user = User.find_by(id: params[:id])
      @books = @user.books
    else
      redirect_to user_path(current_user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)      
    end

end
