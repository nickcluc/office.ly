class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @user = current_user
    @listing = Listing.new
  end

  def index
    radius = params[:radius] ||= 30
    if params[:query]
      @query = params[:query]
      @listings = Listing.near(params[:query], radius )
        if @listings.empty?
          @listings = Listing.all
        end
      @locations = Listing.locations(@listings)
    else
      @listings = Listing.all
      @locations = Listing.locations(@listings)
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      flash[:notice] = "Listing Created Successfully!"
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @header_image_url = @listing.header_image.to_s
    @location = Listing.locations(@listing)
    @reservation = Reservation.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      flash[:notice] = "Listing Updated Successfully"
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Listing Deleted Successfully"
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(
      :title,
      :address,
      :city,
      :state,
      :zip_code,
      :weekly_rate,
      :description,
      :user_id,
      :header_image,
      :listing_type_id
    )
  end
end
