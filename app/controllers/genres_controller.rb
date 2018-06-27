class GenresController < ApplicationController
  def index
  end

  def show
    @genre = Genre.find_by(id: params[:id])
    @books = @genre.books
  end
end
