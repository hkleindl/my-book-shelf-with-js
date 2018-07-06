class BooksController < ApplicationController

  def index
    @books = Book.all
  
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    if params[:user_id].to_i == current_user.id 
      @user = User.find_by(id: params[:user_id])
      @book = Book.new
      @book.ratings.build
      @book.genres.build
    else
      redirect_to new_user_book_path(current_user)
    end
  end

  def create
    @book = Book.new(book_params)
    @book.users << User.find_by(params[:user_id])
    rating = @book.ratings.find do |rating|
      rating.user_id == params[:user_id].to_i  
    end
    rating.stars = params[:book][:ratings_attributes]["0"][:stars]
    if @book.save
      redirect_to user_books_path(params[:user_id])
    else
      render :new
    end
  end

  private

    def book_params
      params.require(:book).permit(:name, :author_name, genre_ids:[], genres_attributes: [:name])
    end
    
end

