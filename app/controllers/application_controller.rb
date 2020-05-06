class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'user_layout'
  require 'rest-client'
  require 'facebookbusiness'
  require 'facebook_ads'
  require 'byebug'

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || reports_path #if resource.has_role? :admin
  end
end
