class PaymentGatewaysController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'admin_layout'
  
  require 'paypal-sdk-rest'
  require 'paypal-checkout-sdk'
  include PayPal::SDK::REST
  include PayPal::SDK::Core::Logging
   
  def payment_complete 
    
  
    client_id = "AV5v9AHk40NNNfwTLIKqsr9CWd1r5z5EkUtr3_e8C8P-ctYOyO7Z0jEELa2RmLyp2ZGkE8Ta3jyLmB3t"
    client_secret = "EFd4YpkReGLH5qZHmjelzKZoGX7fB_RY82gsxJ9b6ZtScrUnOVQ2a9lwQyj-kq-_R6rRhiW4jfAZglMc"
    environment = PayPal::SandboxEnvironment.new(client_id, client_secret)
    client = PayPal::PayPalHttpClient.new(environment)
    request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new(params[:data][:orderID])
    begin
      response = client.execute(request) 
      order = response.result
      @payment = PaypalPayment.create(order_id: order.id,
        full_name: order.purchase_units[0].shipping.name.full_name,  
        address_line_1: order.purchase_units[0].shipping.address.address_line_1,
        admin_area_2:  order.purchase_units[0].shipping.address.admin_area_2,
        admin_area_1: order.purchase_units[0].shipping.address.admin_area_1,
        postal_code:  order.purchase_units[0].shipping.address.postal_code , 
        country_code:  order.purchase_units[0].shipping.address.country_code, 
        payment_id:  order.purchase_units[0].payments.captures[0].id, 
        currency_code: order.purchase_units[0].payments.captures[0].amount.currency_code,
        payment_amount: order.purchase_units[0].payments.captures[0].amount.value)      
      
      start_date = Date.today
      
      if params[:data][:plann_details].include?"Monthly" 
        end_date = Date.today.next_month
      elsif params[:data][:plann_details].include?"Annual"
        end_date = Date.today.next_year
      else
        end_date = Date.today.next_quarter
      end
    
      @subscription_new  = Subscription.create( my_score: params[:data][:paypal_amt], subscription_type: params[:data][:plann_details],
        start_date: start_date, end_date: end_date, agree: params[:data][:terms_and_conditions],
         user_id: current_user.id)
      
    rescue PayPalHttp::HttpError => ioe
      puts ioe.status_code
      puts ioe.headers["debug_id"]
    end
  end
end