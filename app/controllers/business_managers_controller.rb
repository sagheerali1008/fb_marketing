class BusinessManagersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_layout'
  def app_secret_proof
    app_secret = ENV["APP_SECRET_DEMO_ADD"]
    user_token = ENV["USER_ACCESS_TOKEN"]
    app_secret_proof = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), app_secret, user_token)
  end

  def create_child_business_manager
    begin 
      roney_parent_bm_id = ENV["PARENT_BUSINESS_MANGER"]
      app_scoped_user_id = 525518891647274
      system_user_token = ENV["SYSTEM_USER_ACCESS_TOKEN"]
      system_user_app_secret = ENV["APP_SECRET_PROOF_SYSTEM"]
      user_token = ENV["USER_ACCESS_TOKEN"]
      user_app_secret = ENV["APP_SECRET_PROOF_USER"]
      @get_child_bm = RestClient.get "https://graph.facebook.com/v5.0/#{roney_parent_bm_id}/owned_businesses?client_user_id=#{app_scoped_user_id}&access_token=#{system_user_token}&appsecret_proof=#{system_user_app_secret}"

      child_bm_one = JSON.parse @get_child_bm
      child_bm_one_id = child_bm_one['data'][0]['id']
      if child_bm_one_id.present?
        puts "You got child bm id" + child_bm_one['data'][0]['id']
      else
        puts "Not found create"
        @create_child_bm = RestClient.post "https://graph.facebook.com/v5.0/#{roney_parent_bm_id}/owned_businesses", { id: roney_parent_bm_id, 
          name: "Child business manager four", vertical:"OTHER",
          page_permitted_tasks: '["ADVERTISE", "ANALYZE"]', timezone_id: "1", access_token: user_token,
          appsecret_proof: user_app_secret }
        child_bm_two = JSON.parse @get_child_bm 
        child_bm_two_id = child_bm_two['data'][0]['id']      
      end
      if child_bm_one_id.present? || child_bm_two_id.present?
        # @set_child_loc = RestClient.post "https://graph.facebook.com/v5.0/#{PARENT_BM_LINE_OF_CREDIT_ID}/owning_credit_allocation_configs", { receiving_business_id=CHILD_BUSINESS_MANAGER_ID, 
        #   amount=10, access_token=Parent_BM_Admin_System_User_Access_Token,
        #   appsecret_proof=APP_SECRET }
        # Get the Child System User Token
        @get_child_bm_access_token = RestClient.get "https://graph.facebook.com/v5.0/#{CHILD_BUSINESS_MANAGER_ID}/access_token?id=#{CHILD_BUSINESS_MANAGER_ID}&app_id=#{app_id_demo_add}&scope=ads_management,business_management&access_token=#{user_token}&appsecret_proof=#{user_app_secret}"
      else
      end
    rescue RestClient::ExceptionWithResponse => e 
      e.response
    end
  end

  # if @get_child_bm_access_token.present?
  #   @get_child_bm_funding_source_id = RestClient.get "https://graph.facebook.com/v5.0/#{CHILD_BUSINESS_MANAGER_ID}/extendedcredits?fields=id,allocated_amount&access_token=<Child BM Admin System User Access Token>&appsecret_proof=<APP_SECRET>"
  #   if @get_child_bm_funding_source_id.present?
  #     @set_child_loc = RestClient.post "https://graph.facebook.com/<API_VERSION>/CHILD_BM_ID/adaccount"
  #   else
  #     @create_child_bm_access_token = RestClient.post "https://graph.facebook.com/v5.0/#{CHILD_BUSINESS_MANAGER_ID}/access_token", { id: CHILD_BUSINESS_MANAGER_ID, app_id: app_id_demo_add, scope: ads_management,business_management, access_token: user_token, appsecret_proof: user_app_secret }
  #   end
  # else
  #   @child_bm = RestClient.post "https://graph.facebook.com/v5.0/#{roney_parent_bm_id}/owned_businesses", { id: roney_parent_bm_id, 
  #     name: "Child business manager two", vertical:"OTHER",
  #     page_permitted_tasks: '["ADVERTISE", "ANALYZE"]', timezone_id: "1", access_token: user_token,
  #     appsecret_proof: user_app_secret }
  #   childs = JSON.parse(@child_bm)
  # end
  # @get_child_bm = RestClient.get "https://graph.facebook.com/v5.0/#{roney_parent_bm_id}/owned_businesses", { id: roney_parent_bm_id, 
  #   name: "Child business manager two", vertical:"OTHER",
  #   page_permitted_tasks: '["ADVERTISE", "ANALYZE"]', timezone_id: "1", access_token: system_user_token,
  #   appsecret_proof: app_secret_proof } 
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: @childs }
  #   end
  # end

  def index
  end
end