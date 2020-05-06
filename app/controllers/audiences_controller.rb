class AudiencesController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'

  def index
		# access_token = ENV["FB_ACCESS_TOKEN"]
    # app_secret = ENV["FB_APP_SECRET"]
    ad_account_id = ENV["AD_ACCOUNT_ID"]
    id = ENV["AD_ACCOUNT_ID"]
    app_id = ENV["FB_APP_ID"]

    FacebookAds.configure do |config|
      config.access_token = ENV["FB_ACCESS_TOKEN"]
      config.app_secret = ENV["FB_APP_SECRET"]
    end
    ad_account = FacebookAds::AdAccount.get(ad_account_id)
    @pixel = [[ad_account.adspixels.first.name, ad_account.adspixels.first.id]]
    @customaudiences = ad_account.customaudiences({      # fields: ['name','objective'],
  # effective_status: ['ACTIVE','PAUSED']
    })
    @audiences  = Audience.all
  end
  
  def audiences
   
  end

  def basic_audience_create(params, ad_account)
  end

  def lookalike_audience_create(params, ad_account)
    begin
      customaudiences = ad_account.customaudiences.create({ 
        name: "#{audience_params[:name]}",
        subtype: "#{audience_params[:subtype]}",
        origin_audience_id: "#{params[:audience][:origin_audience_id]}",
        lookalike_spec: {'type':"#{audience_params[:fb_type]}",
        'starting_ratio' => "#{audience_params[:starting_ratio]}",
        'ratio':"#{audience_params[:fb_custom_ratio]}",
        'country':"#{audience_params[:country]}"
      }})
    rescue Exception => @e
    end
    return customaudiences
  end

  def create
    FacebookAds.configure do |config|
      config.access_token = ENV["FB_ACCESS_TOKEN"]
      config.app_secret = ENV["FB_APP_SECRET"]
    end
    ad_account = FacebookAds::AdAccount.get(ENV["AD_ACCOUNT_ID"])
    begin
      if Category.find(params[:audience][:category_id]).name == "Prospecting Lookalike"
        customaudiences = lookalike_audience_create(params, ad_account)

      elsif SubCategory.find(audience_params[:sub_category_id]).name == "Social Media Engagors"
        customaudiences = ad_account.customaudiences.create({
          name: "#{audience_params[:name]}",
          rule: {'inclusions':{'operator':'or',
            'rules':[{'event_sources':[{'id':'104245237765328','type':'page'}],'retention_seconds':"#{audience_params[:retention_seconds]}",'filter':{'operator':'and','filters':[{'field':'event','operator':'eq','value':'page_engaged'}]}}]}},
          prefill: '1',
        })
      elsif audience_params[:field] == "event"
        customaudiences = ad_account.customaudiences.create({
          name: "#{audience_params[:name]}",
          rule: {'inclusions':{'operator':'or','rules':[{'event_sources':[{'id':"#{audience_params[:pixel_id]}".to_i,'type':"#{audience_params[:audience_type]}"}],
          'retention_seconds':"#{audience_params[:retention_seconds]}",
          'filter':{'operator':'and','filters':[{'field':'event','operator':'i_contains',
          'value':"#{audience_params[:event]}"}]}}]}},
          prefill: '1',
        })
      elsif audience_params[:field] == "time" || audience_params[:field] == "count"
        customaudiences = ad_account.customaudiences.create({
          name: "#{audience_params[:name]}",
          rule: {'inclusions':{'operator':'or','rules':[{'event_sources':[{'id':"#{audience_params[:pixel_id]}".to_i,'type':"#{audience_params[:audience_type]}"}],
          'retention_seconds':"#{audience_params[:retention_seconds]}",
          'aggregation': {"type":"#{audience_params[:field]}", "operator":"#{audience_params[:operator]}", "value": "#{audience_params[:time]}"},
          'filter':{'operator':'and','filters':[{'field':'url','operator':'i_contains',
          'value':"#{audience_params[:value]}"}]}}]}},
          prefill: '1',
        })       
      else
        customaudiences = ad_account.customaudiences.create({
          name: "#{audience_params[:name]}",
          rule: {'inclusions':{'operator':'or','rules':[{'event_sources':[{'id':"#{audience_params[:pixel_id]}".to_i,'type':"#{audience_params[:audience_type]}"}],
          'retention_seconds':"#{audience_params[:retention_seconds]}",
          'filter':{'operator':'and','filters':[{'field':'url','operator':'i_contains',
          'value':"#{audience_params[:value]}"}]}}]}},
          prefill: '1',
        })
      end
      if customaudiences.present?
        @audience = Audience.create(audience_params.merge({customaudience_id: customaudiences.id}))
      end
    rescue Exception => @e
    end
    if @audience.present?
      redirect_to audiences_path, notice: 'Audience was successfully created.' 
    else
      redirect_to audiences_path, notice: "#{@e.to_s}" 
    end
  end

  def show
  	@audience = Audience.find(params[:id])
  end

  def destroy
    begin
      audience = Audience.find(params[:id])
      FacebookAds.configure do |config|
        config.access_token = ENV["FB_ACCESS_TOKEN"]
        config.app_secret = ENV["FB_APP_SECRET"]
      end
      ad_account = FacebookAds::AdAccount.get(ENV["AD_ACCOUNT_ID"])
      custom_audience = FacebookAds::CustomAudience.get(audience.customaudience_id) 
      custom_audience.destroy({})
    rescue Exception => @e
    end
    audience.destroy if @e.blank?
    redirect_to audiences_path, notice: 'Audience was successfully deleted.' if @e.blank?
    redirect_to audiences_path, notice: "#{@e}" if @e.present?
  end

  private
  def audience_params
    params.require(:audience).permit(:name, :pixel_id, :audience_type, :retention_seconds, :value, :sub_category_id, :subtype, :origin_audience_id, :fb_type, :country, :fb_custom_ratio, :starting_ratio, :page_id, :description, :field, :event, :operator, :time)
  end
end
