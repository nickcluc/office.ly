class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  has_many :listings
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
