class RulesController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'

  require 'facebookbusiness'
  require 'byebug'
  require 'facebook_ads'

  def index    
    access_token = ENV["FB_ACCESS_TOKEN"]
    app_secret = ENV["FB_APP_SECRET"]
    ad_account_id = ENV["FB_SANDBOX_AD_ACCOUNT_ACT"]
    app_id = ENV["FB_APP_ID"]
    FacebookAds.configure do |config|
      config.access_token = access_token
      config.app_secret = app_secret
    end
     ad_account = FacebookAds::AdAccount.get(ad_account_id)
     @rules = ad_account.adrules_library({
     fields: ['name','status']
    })
  end

  def show
    begin
      @r = RestClient.get "https://graph.facebook.com/v5.0/#{params[:id]}?access_token=#{ENV['FB_ACCESS_TOKEN']}"
      @rule = Rule.find_by(params[:fb_rule_id])
    rescue Exception => e
    end
  end

  def new
    @rules = Rule.new 
  end
  
  def destroy
    begin
      @r = RestClient.delete "https://graph.facebook.com/v5.0/#{params[:id]}?access_token=#{ENV['FB_ACCESS_TOKEN']}"
      if JSON.parse(@r).include? "success"
        @rule = Rule.find_by(params[:fb_rule_id])
        @rule.destroy
        redirect_to rules_path
      end
    rescue Exception => e
    end
  end

  def edit
    require 'rest-client'
    begin
      @r = RestClient.get "https://graph.facebook.com/v5.0/#{params[:id]}?access_token=#{ENV['FB_ACCESS_TOKEN']}"
      @rule = Rule.find_by(params[:fb_rule_id])
    rescue Exception =>e
    end
  end

  def update
    begin
      require 'rest-client' 
      @rule = Rule.find_by(params[:fb_rule_id])
        if @rule.present?
        @rule = Rule.update(evaluation_type: params['rule']['evaluation_type'],
        name: params['rule']['name'],
        value: params['rule']['value'],
        operator: params['rule']['operator'],
        schedule_spec: params['rule']['schedule_spec'],
        evaluation_spec: params['rule']['evaluation_spec'],
        attribution_window:params['rule']['attribution_window'],
        insight:params['rule']['insight'],
        entity_type: params['rule']['entity_type'],
        filter_field: params['rule']['filter_field'],
        filter_operation: params['rule']['filter_operation'],
        filter_value: params['rule']['filter_value'],
        time_preset: params['rule']['time_preset'],
        status: params['rule']['status'])
        redirect_to rules_path
      else
        render 'edit'
      end
    rescue Exception => e
    end
  end

  def create
    notification_user_id = '521209365411560'
    access_token = ENV["FB_ACCESS_TOKEN"]
    app_secret = ENV["FB_APP_SECRET"]
    ad_account_id = ENV["FB_SANDBOX_AD_ACCOUNT_ACT"]
    app_id = ENV["FB_APP_ID"]
    FacebookAds.configure do |config|
      config.access_token = access_token
      config.app_secret = app_secret
    end
    ad_account = FacebookAds::AdAccount.get(ad_account_id)
    fb_rule = ad_account.adrules_library.create({
      execution_spec: { 'execution_type': "PAUSE", 'execution_options': [ { 'field': 'user_ids', 'value': [notification_user_id], 'operator': 'EQUAL' } ] },
      name: params['rule']['name'],
      status: params['rule']['status'],
      schedule_spec: { 'schedule_type': 'DAILY' },
      evaluation_spec: { 'evaluation_type': 'SCHEDULE',
       'filters': [{ 'field': 'time_preset', 'value': "#{params['rule']['time_preset']}", 'operator': 'EQUAL' },
        { 'field': 'entity_type', 'value': "#{params['rule']['entity_type']}", 'operator': 'EQUAL' },
        { 'field': "#{params['rule']['insight']}", 'value': "#{params['rule']['value']}", 'operator': "#{params['rule']['operator']}" }] }
      })
    
    if fb_rule.present?
      @rule = Rule.create(
      name: params['rule']['name'],
      value: params['rule']['value'],
      operator: params['rule']['operator'],
      insight:params['rule']['insight'],
      entity_type: params['rule']['entity_type'],
      time_preset: params['rule']['time_preset'],
      status: params['rule']['status'],fb_rule_id: fb_rule.id)
      if @rule.save
        redirect_to rules_path
      else
        render 'new'
      end
    else 
       render 'new'
    end
  end
  def get_design  
  end
end