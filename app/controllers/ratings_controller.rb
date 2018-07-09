class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @user = User.find_by(id: params[:user_id])
    @book = Book.find_by(id: params[:book_id])
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to user_path(@rating.user_id)
    else
      flash[:notice] = @rating.errors.full_messages
      redirect_to book_path(@rating.book)
    end
  end

  def edit
    
  end

  def update
    
  end

  private

    def rating_params
      params.require(:rating).permit(:book_id, :user_id, :stars)  
    end
end
