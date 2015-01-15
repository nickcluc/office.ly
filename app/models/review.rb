class Review < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :rating, presence: true
  validates :comment, length: { minimum: 25 }
end
