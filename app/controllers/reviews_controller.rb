class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
    if @listing.user == current_user
      redirect_to listing_path(@listing),
      notice: "You can't review a listing you created!"
    end
  end

  def create
    @review = Review.new(review_params)
    @review.listing = Listing.find(params[:listing_id])
    @review.user = current_user
    if @review.save
      redirect_to listing_path(@review.listing)
      flash[:notice] = "Review Posted Successfully!"
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :overall_rating,
      :amenities_rating,
      :location_rating,
      :cleanliness_rating,
      :company_rating,
      :comment,
      :user_id,
      :listing_id)
  end
end
