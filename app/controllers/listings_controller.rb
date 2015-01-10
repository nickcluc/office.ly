class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @user = current_user
    @listing = Listing.new
  end

  def index
    @listings = Listing.all
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to listing_path(@listing), notice: "Listing Created Successfully!"
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end



  private

  def listing_params
    params.require(:listing).permit(
      :title,
      :address,
      :city,
      :state,
      :zip_code,
      :rate_cents,
      :description,
      :user_id,
      :header_image
    )
  end
end
