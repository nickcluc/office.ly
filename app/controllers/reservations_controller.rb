class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def index
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.listing = Listing.find(params[:listing_id])
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      @listing = @reservation.listing
      @location = Listing.locations(@listing)
      @errors = @reservation.errors
      render "listings/show"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :listing_id)
  end
end
