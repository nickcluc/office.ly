class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  has_many :listings
  has_many :reviews
  has_many :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
