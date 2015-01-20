class HomesController < ApplicationController
  def index
    @featured = Listing.all.sample
    if cookies["lat_lng"]
      @current_location = cookies["lat_lng"]
    end
  end
end
