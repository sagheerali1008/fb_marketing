class WelcomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :about_us, :terms_and_conditionss, :privacy_policy, :cookie_policy]
  layout 'user_layout' #, only: [:index, :about_us, :terms_and_conditionss, :privacy_policy, :cookie_policy], except: [:report]

  def index
  end

  def about_us
  end

  def terms_and_conditionss
  end

  def privacy_policy
  end

  def cookie_policy
  end

end
