class AuthorsController < ApplicationController
  def index
  end

  def show
    @author = Author.find_by(params[:author_id])
  end
end