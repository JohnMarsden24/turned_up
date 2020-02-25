class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @artist = User.find(params[:user_id])

  end

  def create
    @review = Review.new(review_params)
    @artist = User.find(params[:user_id])
    @review.artist_id = params[:user_id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to user_path(@artist)
    else
      render :new
    end
  end

  def edit
    find_review
  end

  def update
  end

  def destroy
  end

private

  def  find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
