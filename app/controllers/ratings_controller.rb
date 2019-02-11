class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @user = User.find_by(id: params[:user_id])
    @book = Book.find_by(id: params[:book_id])
  end

  def create
    @rating = Rating.new(rating_params)
    render json: @rating, status: 201
    # if @rating.save
    
    #   TODO: 1. Replace form with edit and delete buttons 
    #         2. Append rating to book json
    #         3. Render newly added rating in rating list

    #   redirect_to user_path(@rating.user_id)
    # else
    #   flash[:notice] = @rating.errors.full_messages
    #   redirect_to book_path(@rating.book)
    # end
  end

  def edit
    @rating = Rating.find_by(id: params[:id])
  end

  def update
    @rating = Rating.find_by(id: params[:id])
    if @rating.update(stars: params[:rating][:stars])
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @rating = Rating.find_by(id: params[:id])
    @rating.destroy
    redirect_to user_path(current_user)
  end

  private

    def rating_params
      params.require(:rating).permit(:book_id, :user_id, :stars)  
    end
end
