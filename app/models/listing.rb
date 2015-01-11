class Listing < ActiveRecord::Base
  mount_uploader :header_image, ListingPhotoUploader

  belongs_to :user

  validates :title, :address, :city,
            :state, :zip_code, :rate_cents, :user_id,
            presence: true

  def self.addresses
    addresses = []
    listings = self.all
    listings.each do |listing|
      addresses << "#{listing.address} #{listing.city}, #{listing.state} #{listing.zip_code}"
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
