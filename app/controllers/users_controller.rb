class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @books = @user.books
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)      
    end

end
