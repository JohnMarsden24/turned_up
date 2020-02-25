class PagesController < ApplicationController
  def home
    @users = User.where(artist: true)
  end
end
