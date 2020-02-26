class UsersController < ApplicationController

  def home
  end

  def index
    @artists = User.where(artist: true)
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
