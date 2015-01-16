class HomesController < ApplicationController
  def index
    @featured = Listing.all.sample
    @current_location = request.location
    binding.pry
  end
end
