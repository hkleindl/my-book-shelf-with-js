class BooksController < ApplicationController
  def index
    if current_user
      @books = current_user.books
    else
      @books = Book.all
    end
  end

  def show
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @book = Book.new
    @book.ratings.build
  end

  def create
    @book = Book.new(book_params)
    @book.users << User.find_by(params[:user_id])
    @book.ratings.build(stars: params[:ratings][:stars], user_id: params[:user_id])
    
    if @book.save
      redirect_to user_books_path(params[:user_id])
    else
      render :new
    end
  end

  private

    def book_params
      params.require(:book).permit(:name, :author_name, ratings_attributes: [:stars])
    end
    
end

