class UsersController < ApplicationController

  def home
  end

  def index
    # @artists = User.where(artist: true)
    if params[:query].present?
      # sql_query = "artist_name ILIKE :query OR description ILIKE :query OR location ILIKE :query OR genre ILIKE :query"
      # @artists = User.where(sql_query, query: "%#{params[:query]}%")
      @artists = User.search_by_everything(params[:query])
    else
      @artists = User.where(artist: true)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :avatar, :artist, :artist_name, :location, :genre, :price, :photo, :description)
  end
end
