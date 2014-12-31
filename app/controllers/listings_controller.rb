class ListingsController < ApplicationController
  # before_filter :authenticate!, :except => [:index]

  def new
    @user = current_user
    @listing = Listing.new
  end

  def index

  end

  def create
    @listing = Listing.create(listing_params)
    if @listing.save
      redirect_to listing_path(@listing), notice: 'Listing Created Successfully!'
    else
      render "new"
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(
      :created_by,
      :rate_cents,
      :zip_code,
      :state,
      :city,
      :address,
      :description,
      :title
      )
  end
end
