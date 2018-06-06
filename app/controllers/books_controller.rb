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

  private

    def book_params
      params.require(:book).permit(:name, :author_name, ratings_attributes: [:stars])
    end
    
end
