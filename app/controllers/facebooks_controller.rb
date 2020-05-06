class FacebooksController < ApplicationController

  def create_business
    begin
      api_id = Facebook.first.fb_user_id
      api_access_token = Facebook.first.fb_access_token

      @businesses = RestClient.post "https://graph.facebook.com/v5.0/#{api_id}/businesses", { name: "Rango_one", vertical: "ADVERTISING", timezone_id:"1",access_token: api_access_token }
      biz = JSON.parse(@businesses)
      respond_to do |format|
        format.html
        format.json { render json: biz }
      end
    rescue RestClient::ExceptionWithResponse => @e
      @e.response
      respond_to do |format|
        format.html
        format.json {render json: @e.response }
      end
    end
  end

  def set_business
    Facebook.delete_all
    @facebook = Facebook.create(fb_access_token: params[:access_token],fb_user_id: params[:user_id])
    if @facebook.save
      render json: { data: @facebook },status:200
    else
      render json: { message: "failed to store parametrs" },status:400
    end
  end

  def new_page
    begin
      api_id = Facebook.first.fb_user_id
      api_access_token = Facebook.first.fb_access_token
      # To get business manager details
      @data = RestClient.get "https://graph.facebook.com/v5.0/#{api_id}/businesses?access_token=#{api_access_token}"
      api = JSON.parse(@data)
      if api['data'].present?
        business_account_id = api['data'][0]['id']
        business_account_name = api['data'][0]['name']
        if business_account_id.present? && business_account_name.present?
          @business_manager = BusinessManager.create(business_account_id: business_account_id, business_account_name: business_account_name)
          @business_manager.save
        end
      end
      #For finding ad accounts of business manager
      if @business_manager.present?
        begin
          business_id = @business_manager.business_account_id
          ad = RestClient.get "https://graph.facebook.com/v5.0/#{business_id}/owned_ad_accounts?access_token=#{api_access_token}"
          accounts_ad = JSON.parse(ad)
          @ad_account_id = accounts_ad['data'][0]['account_id']
        rescue RestClient::ExceptionWithResponse => @e
          respond_to do |format|
            format.html
            format.json { render json: @e.response }
          end
        end
      end
    rescue RestClient::ExceptionWithResponse => @e
      if @e.response.code === 403
        begin
          api_id = Facebook.first.fb_user_id
          api_access_token = Facebook.first.fb_access_token
          businesses = RestClient.post "https://graph.facebook.com/v5.0/#{api_id}/businesses", { name: "Rango_one", vertical: "ADVERTISING", timezone_id:"1",access_token: api_access_token }
          @biz = JSON.parse(businesses)
        rescue RestClient::ExceptionWithResponse => @e
          @e.response
          respond_to do |format|
            format.html
            format.json {render json: @e.response }
          end
        end
      else
        respond_to do |format|
          format.html
          format.json {render json: @e.response }
        end
      end
    end
  end

  def script_page
  end
end