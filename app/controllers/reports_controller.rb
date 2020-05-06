class ReportsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'
  include ReportsHelper

  def index
  end

  def audiences
    @subcateories  = SubCategory.all
    @categories = Category.all
    @audiences = Audience.all
    audience_with_category
  end

  def get_audiences
    @audiences = Audience.where(sub_category_id: params[:subcategory_ids])
    audience_with_category
    respond_to do |format|
      format.html do
        render partial: "audiences_list", object: @audiences_with_category#,  locals: { project: project.id}
      end
    end
  end

  def create_ad_step2
    @audiences = Audience.where(id: params[:audience_ids])
    audience_with_category
    respond_to do |format|
      format.html do
        render partial: "ad_create_step2", object: @audiences_with_category
      end
    end
  end

  def create_ad_step3
    respond_to do |format|
      format.html do
        render partial: "ad_create_step3"
      end
    end
  end

  def create_campaign
    campaign = Campaign.new(name: params[:campaign_name], daily_budget: params[:cbo_budget])
    campaign.save
    respond_to do |format|
      format.html do
        render partial: "campaign_search_and_drop_box"
      end
    end
  end

  # get creatives, facebook posts and instagram posts
  def create_ad_set
    begin
      get_all_posts_ids
      get_all_media_urls
      # Get all ad ID's
      ad_ids = RestClient.get "https://graph.facebook.com/v5.0/#{ENV["FB_SANDBOX_AD_ACCOUNT_ACT"]}/ads?access_token=#{ENV["FB_ACCESS_TOKEN"]}"
      parsed_ad_ids = JSON.parse ad_ids
      @frames = get_frames(parsed_ad_ids)
    rescue RestClient::ExceptionWithResponse => err
      flash[:notice] = "#{err}"
      redirect_to  reports_path
    end
  end

  def save_created_ad_set
    redirect_to  reports_path
  end

  # To get Page Post IDs
  def get_all_posts_ids
    page_posts_all = RestClient.get "https://graph.facebook.com/v5.0/#{ENV["FB_ASSOCIATED_PAGE"]}/posts?access_token=#{ENV["FB_ACCESS_TOKEN"]}"
    posts = JSON.parse page_posts_all
    @all_posts = []
    posts['data'].each do |fb_post|
      @all_posts << fb_post['id']
    end
  end

  # To get current Instagram profile media urls (tester account -- For development)
  def get_all_media_urls
    media_fields_all = RestClient.get "https://graph.instagram.com/me/media?fields=id,caption&access_token=#{ENV["IG_ACCESS_TOKEN"]}"
    media_fields = JSON.parse media_fields_all
    @all_media_urls = []
    media_fields['data'].each do |field|
      media_data = RestClient.get "https://graph.instagram.com/#{field['id']}?fields=id,media_type,media_url,username,timestamp&access_token=#{ENV["IG_ACCESS_TOKEN"]}"
      parsed_media_data = JSON.parse media_data
      @all_media_urls << parsed_media_data['media_url']
    end
  end
  

  private

  def audience_with_category
    audiences_category = Category.where(id: SubCategory.where(id: @audiences.pluck(:sub_category_id)).pluck(:category_id))
    @audiences_with_category = {}
    audiences_category.each do |aurd_cat|
      @audiences_with_category[aurd_cat.id] = @audiences.where(sub_category_id: aurd_cat.sub_categories.pluck(:id))
    end
  end

end
