class HomesController < ApplicationController
  def index
    @listings = Listing.search(params[:search])
    @featured = Listing.all.sample
  end
end
