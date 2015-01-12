class Listing < ActiveRecord::Base
  mount_uploader :header_image, ListingPhotoUploader

  belongs_to :user

  validates :title, :address, :city,
            :state, :zip_code, :rate_cents, :user_id,
            presence: true

  geocoded_by :full_street_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def full_street_address
    [address, city, state, zip_code].compact.join(', ')
  end

  def self.addresses
    addresses = []
    listings = self.all
    listings.each do |listing|
      addresses << [listing.latitude, listing.longitude]
    end
    addresses
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
