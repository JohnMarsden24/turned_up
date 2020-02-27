class ReviewsController < ApplicationController

  def new
    if current_user
      @review = Review.new
      @artist = User.find(params[:user_id])
    else
      flash[:error] = "Must be signed in"
      redirect_to new_user_session_path
    end
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
    @review = find_review
  end

  def update
    @review = find_review
    @artist = User.find(@review.artist_id)
    if @review.update(review_params)
      redirect_to user_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @review = find_review
    @artist = User.find(@review.artist_id)
    @review.destroy
    redirect_to user_path(@artist)
  end

private

  def  find_review
    Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
