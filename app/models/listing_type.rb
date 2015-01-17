class ListingType < ActiveRecord::Base
  has_many :listings

  validates :title, :description, presence: true
end
