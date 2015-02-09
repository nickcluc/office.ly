class HomesController < ApplicationController
  def index
    @featured = Listing.take
    if cookies["lat_lng"]
      @current_location = cookies["lat_lng"]
    end
  end
end
