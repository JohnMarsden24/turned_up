class UsersController < ApplicationController

  def home
    # @artists = User.where(artist: true)
  end

  def index
    @artists = User.where(artist: true)
  end

  def show
    # @artists = User.where(artist: true)
    # @artist = @artists.find(params[:id])
    # @users = User.where(artist: false)
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # @artists = User.where(artist: true)
    # @artist = @artists.find(params[:id])
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
