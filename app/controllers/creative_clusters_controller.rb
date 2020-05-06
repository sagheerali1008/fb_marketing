class CreativeClustersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'
  
  def ad_creative_cluster
    begin
      access_token = ENV["FB_ACCESS_TOKEN"]
      app_secret = ENV["FB_APP_SECRET"]
      app_id = ENV["FB_APP_ID"]
      id = ENV["FB_SANDBOX_AD_ACCOUNT"]
      id_act = ENV["FB_SANDBOX_AD_ACCOUNT_ACT"]
      page_id = ENV["FB_ASSOCIATED_PAGE"]
      
      FacebookAds.configure do |config|
        config.access_token = access_token
        config.app_secret = app_secret
      end
      
      get_page_posts = RestClient.get "https://graph.facebook.com/v5.0/#{page_id}/posts?access_token=#{access_token}"
      parsed_posts = JSON.parse get_page_posts
      
      all_posts = []
      parsed_posts['data'].each do |fb_post|
        all_posts << fb_post['id']
      end
  
      all_creatives = []
      all_posts.each do |post|
        creative = RestClient.post "https://graph.facebook.com/v6.0/#{id_act}/adcreatives", {
          name: "New creative new", object_story_id: "#{post}",
          access_token: "EAAQmKM9i1iwBAIqjZCQg6ZBbZAN8XylToUkugRgKwziRVyZA2RSCb6nLYxtKeuyZA6sZAQTBaBD60ZB2CxPRLxAZCO5SKiMC2G4EbIpVOHluvC7swgcZBNdwAsluvFZAhkRuiBULIkbFKvrYin0yavJjcd6Cm4bES2aDdPNjWvOlMirdBmcvXpQKmjVhlkxLv2gncZD"
        }
        creative_id = JSON.parse creative
        all_creatives << creative_id['id']
      end
  
      get_ad_sets = RestClient.get "https://graph.facebook.com/v6.0/#{id_act}/adsets?access_token=#{access_token}"
      parsed_ad_sets = JSON.parse get_ad_sets
      ad_set_ids = []
      parsed_ad_sets['data'].each do |ad_set_id|
        ad_set_ids << ad_set_id['id']
      end

      creative_iframes = []
      all_creatives.each do |c|
        get_creative_preview = RestClient.get "https://graph.facebook.com/v6.0/#{c}/previews?ad_format=DESKTOP_FEED_STANDARD&access_token=#{access_token}"
        parsed_creative_preview = JSON.parse get_creative_preview
        creative_iframes << parsed_creative_preview['data'] 
      end
      
      all_iframes = []
      creative_iframes.each do |iframe|
        all_iframes << iframe[0]['body']
      end

      @frames = []
      all_iframes.each do |frame|
        @frames << frame.delete('\\"').split[1].split("src=")[1].remove("amp;") 
      end
      @ad_copies = ["🤔NOT ALL LIGHT THERAPY DEVICES ARE CREATED EQUAL. STAY AWAY FROM COPYCAT BRANDS.",
        "😍MASSIVE $60 OFF SALE ON TODAY! ✅ENTER Discount Code: SAVE60 ✅FREE SHIPPING TODAY",
        "🤔Sick of wasting money on skin products that don't work? 👍LIGHT THERAPY HAS BEEN THE ANSWER FOR SO MANY WOMEN!"]          
      
      ids = {}
      names = {}
      
      get_campaigns = RestClient.get "https://graph.facebook.com/v6.0/act_568084930708476/campaigns?access_token=EAAQmKM9i1iwBAIqjZCQg6ZBbZAN8XylToUkugRgKwziRVyZA2RSCb6nLYxtKeuyZA6sZAQTBaBD60ZB2CxPRLxAZCO5SKiMC2G4EbIpVOHluvC7swgcZBNdwAsluvFZAhkRuiBULIkbFKvrYin0yavJjcd6Cm4bES2aDdPNjWvOlMirdBmcvXpQKmjVhlkxLv2gncZD&fields=name" 
      parsed_campaigns = JSON.parse get_campaigns       

      parsed_campaigns['data'].each do |camp|
        campaign_id = camp['id']
        campaign_name = camp['name']
        get_campaigns_ad_set = RestClient.get "https://graph.facebook.com/v6.0/#{campaign_id}/adsets?access_token=EAAQmKM9i1iwBAIqjZCQg6ZBbZAN8XylToUkugRgKwziRVyZA2RSCb6nLYxtKeuyZA6sZAQTBaBD60ZB2CxPRLxAZCO5SKiMC2G4EbIpVOHluvC7swgcZBNdwAsluvFZAhkRuiBULIkbFKvrYin0yavJjcd6Cm4bES2aDdPNjWvOlMirdBmcvXpQKmjVhlkxLv2gncZD&fields=name" 
        parsed_campaigns_ad_set = JSON.parse get_campaigns_ad_set
        ids[campaign_id] = parsed_campaigns_ad_set['data']
        names[campaign_name] = parsed_campaigns_ad_set['data']     
      end

      @campaign_names = names.keys
      names.each do |key,value|
        @camp_ad_sets = value  
      end    
    rescue RestClient::ExceptionWithResponse => err      
      flash[:notice] = "#{err}"
      redirect_to  reports_path
    end
  end
end