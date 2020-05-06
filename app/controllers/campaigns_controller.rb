class CampaignsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'

  def new
    @campaign = Campaign.new
  end

  def index
    FacebookAds.configure do |config|
      config.access_token = ENV["FB_ACCESS_TOKEN"]
      config.app_secret = ENV["FB_APP_SECRET"]
    end
    ad_account = FacebookAds::AdAccount.get(ENV["FB_SANDBOX_AD_ACCOUNT_ACT"])
    @campaignss = ad_account.campaigns({
      fields: ['name','objective','special_ad_category','status','buying_type','daily_budget'],
      effective_status: ['ACTIVE','PAUSED']
    })
  end

  def create
    FacebookAds.configure do |config|
      config.access_token = ENV["FB_ACCESS_TOKEN"]
      config.app_secret = ENV["FB_APP_SECRET"]
    end
    ad_account = FacebookAds::AdAccount.get(ENV["FB_SANDBOX_AD_ACCOUNT_ACT"])
    begin

      campaign_result = ad_account.campaigns.create({
        objective: params['campaign']['objective'],
        special_ad_category: params['campaign']['special_ad_category'],
        # status: params['campaign']['status'],
        # buying_type: params['campaign']['buying_type'],
        name: params['campaign']['name'],
        daily_budget: params['campaign']['daily_budget']
      })

    rescue Exception => e
      campaign_result = ""
    end

    if campaign_result.present?  
      @campaign = Campaign.new(objective: params['campaign']['objective'],
        special_ad_category: params['campaign']['special_ad_category'],                                 
        status: params['campaign']['status'], buying_type: params['campaign']['buying_type'],
        name: params['campaign']['name'], daily_budget: params['campaign']['daily_budget'], campaign_id: campaign_result.id )
      if @campaign.save
        redirect_to campaigns_path
      else
       redirect_to campaigns_path
      end
    else
      redirect_to campaigns_path
    end
  end

  def campaign_overview
    id = 120330000304768708

    FacebookAds.configure do |config|
      config.access_token = ENV["FB_ACCESS_TOKEN"]
      config.app_secret = ENV["FB_APP_SECRET"]
    end
    campaign = FacebookAds::Campaign.get(id)
    @adsetss = campaign.adsets({
      fields: ['name','start_time','end_time','daily_budget','lifetime_budget'],
    })
  end

  def create_new_adset
    begin
      id = ENV["FB_SANDBOX_AD_ACCOUNT_ACT"]

      FacebookAds.configure do |config|
        config.access_token = ENV["FB_ACCESS_TOKEN"]
        config.app_secret = ENV["FB_APP_SECRET"]
      end
      ad_account = FacebookAds::AdAccount.get(id)
      adsets = ad_account.adsets.create({
        name: 'My Second AdSet',
        # lifetime_budget: '500',
        start_time: '2020-01-15T23:41:41-0800',
        end_time: '2020-01-14T23:41:41-0800',
        campaign_id: '120330000304768708',
        bid_amount: '500',
        billing_event: 'IMPRESSIONS',
        optimization_goal: 'POST_ENGAGEMENT',
        targeting: {'age_min':20,'age_max':24,'behaviors':[{'id':6002714895372,'name':'All travelers'}],'genders':[1],'geo_locations':{'countries':['US'],'regions':[{'key':'4081'}],'cities':[{'key':'777934','radius':10,'distance_unit':'mile'}]},'interests':[{'id':'6003139266461','name':'Movies'}],'life_events':[{'id':6002714398172,'name':'Newlywed (1 year)'}],'facebook_positions':['feed'],'publisher_platforms':['facebook','audience_network']},
        status: 'PAUSED'
      })
      respond_to do |format|
        format.html
        format.json { render json: adsets }
      end
    rescue Exception => e
      respond_to do |format|
        format.html
        format.json { render json: e }
      end
    end
  end
end