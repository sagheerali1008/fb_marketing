class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'

  def index
  end

  def new
  end  

  def show
  end
  def create
    @subscription = Subscription.new(:user => current_user)
    @subscriptions = current_user.subscriptions.build(subs_params)
    @subscriptions.start_date =Date.today
    if @subscriptions.save
      if  subs_params[:subscription_type].include? "Annual"
        @subscriptions.my_score = subs_params[:my_score].to_i * 12
        @subscriptions.save
      elsif subs_params[:subscription_type].include? "Quarterly"
        @subscriptions.my_score = subs_params[:my_score].to_i * 3
        @subscriptions.save
      end
      redirect_to subscriptions_path 
    else
      render new
    end
  end

  private
  def subs_params
    params.require(:subscription).permit(:agree,:start_date,:end_date,:subscription_type,:my_score,:cost_value,:pay_value)
  end
end
