class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @artist = User.find(params[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.artist = User.find(params[:user_id])
    raise
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :date)
  end

end
