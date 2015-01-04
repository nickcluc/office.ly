class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
