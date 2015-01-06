class Listing < ActiveRecord::Base
  searchkick
  belongs_to :user

  validates :title, :address, :city,
            :state, :zip_code, :rate_cents, :user_id,
            presence: true
end
