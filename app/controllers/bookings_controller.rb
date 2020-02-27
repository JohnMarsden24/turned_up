class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @artist = User.find(params[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      @error_message = @booking.errors.full_messages[0]
      new
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to users_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :artist_id, :confirmed)
  end
end
