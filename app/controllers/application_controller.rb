class ApplicationController < ActionController::Base
  helper :avatar
  protect_from_forgery with: :exception
end
