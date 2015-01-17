class Listing < ActiveRecord::Base
  mount_uploader :header_image, ListingPhotoUploader

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations
  belongs_to :listing_type

  validates :title, :address, :city,
            :state, :zip_code, :weekly_rate, :user_id,
            presence: true

  geocoded_by :full_street_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def full_street_address
    [address, city, state, zip_code].compact.join(', ')
  end

  def full_address
    [address, city, state, zip_code].compact.join(' ')
  end

  def self.locations(listings)
    locations = []
    if listings.class == self
      locations << [listings.latitude, listings.longitude]
    else
      listings.each do |listing|
        locations << [listing.latitude, listing.longitude]
      end
    end
    locations
  end

end
