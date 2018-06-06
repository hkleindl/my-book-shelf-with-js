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
    @book = Book.new
    @book.ratings.build
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        redirect_to user_books_path(current_user)
      else
        render :new
      end
  end

  private

    def book_params
      params.require(:book).permit(:name, :author_name, ratings_attributes: [:stars])
    end
    
end
