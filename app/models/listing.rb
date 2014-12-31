class Listing < ActiveRecord::Base
  validates :title, :address, :city, :state, :zip_code, :rate_cents, presence: true
end
