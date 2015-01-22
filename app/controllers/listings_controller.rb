class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @user = current_user
    @listing = Listing.new
  end

  def index
    radius = params[:radius] ||= 5
    if params[:query]
      @query = params[:query]
      @listings = Listing.near(params[:query], radius )
        if @listings.empty?
          @listings = []
        end
      @locations = Listing.locations(@listings)
    else
      @listings = Listing.all
      @locations = Listing.locations(@listings)
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @amenities = params[:listing][:amenity_ids]
    @listing.user_id = current_user.id
    if @listing.save
      @amenities.each do |amenity_id|
        unless amenity_id == ""
          ListingAmenity.create(listing_id: @listing.id, amenity_id: amenity_id)
        end
      end
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
    @amenities = params[:listing][:amenity_ids]
    if @listing.update_attributes(listing_params)
      @amenities.each do |amenity_id|
        unless amenity_id == ""
          amenity = ListingAmenity.find_or_initialize_by(listing_id: @listing.id, amenity_id: amenity_id)
          amenity.save
        end
      end
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
      :amenity_ids,
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
