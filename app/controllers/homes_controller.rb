class HomesController < ApplicationController
  def index
    @featured = Listing.all.sample
    if cookies["lat_lng"]
      current_location = Geocoder.search(cookies["lat_lng"])
      @current_location = "#{current_location.first.city}, #{current_location.first.state}"
    end
  end
end
