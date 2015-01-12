class ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = Listing.find(params[:listing_id])
    @review.user = current_user
    if @review.save
      redirect_to listing_path(@review.listing),
      notice: "Review Posted Successfully!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :listing_id)
  end
end
