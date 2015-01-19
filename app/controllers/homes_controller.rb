class HomesController < ApplicationController
  def index
    @featured = Listing.all.sample
  end
end
