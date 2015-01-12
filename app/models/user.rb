class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  has_many :listings
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
