Rails.application.routes.draw do
  
  resources :sub_categories
  resources :categories do
    member do
      get :get_sub_categories, defaults: { format: "js" }
    end
  end

  resources :audiences
  get 'reports/audiences', :to => 'reports#audiences', as: "reports_audiences"
  get 'reports/get_audiences', :to => 'reports#get_audiences', as: "get_audiences"
  get 'reports/create_ad_set', :to => 'reports#create_ad_set', as: "create_ad_set"
  get 'reports/create_ad_step2', :to => 'reports#create_ad_step2', as: "create_ad_step2"
  get 'reports/create_ad_step3', :to => 'reports#create_ad_step3', as: "create_ad_step3"
  post 'reports/save_created_ad_set', :to => 'reports#save_created_ad_set', as: "save_created_ad_set"
  get  'reports/create_campaign', :to => 'reports#create_campaign', as: 'create_campaign'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root :to => 'welcome#index'

  get 'welcome/about_us', :to => 'welcome#about_us'
  get 'welcome/terms_and_conditionss', :to => 'welcome#terms_and_conditionss'
  get 'welcome/privacy_policy', :to => 'welcome#privacy_policy'
  get 'welcome/cookie_policy', :to => 'welcome#cookie_policy'
  get 'reports/index', :to => 'reports#index', as: "reports"
  get '/get_design', to: 'rules#get_design'
  resources :campaigns
  resources :subscriptions
  resources :rules
  resources :admin_users
  get '/business_manager', to: 'facebooks#new_page'
  get '/script', to: 'facebooks#script_page'
  get '/set_business', to: 'facebooks#set_business'
  get '/create_business', to: 'facebooks#create_business'
  get '/ad_accounts', to: 'facebooks#ad_accounts'

  #routes for payments gateway
  get 'create_payment', to: 'payment_gateways#create_payment'
  post 'payment_complete', to: 'payment_gateways#payment_complete'
  get 'new_page', to: 'payment_gateways#new'
  get 'child_bm', to: 'business_managers#create_child_business_manager'
  ## Routes for Creative Clusters
  get 'creative_clusters', to: 'creative_clusters#ad_creative_cluster'
  get 'posts', to: 'creative_clusters#page_posts'
  # get 'creatives_upload', to: 'creative_clusters#creatives_upload'
  get 'campaign_set_up', to: 'audience_type_templates#campaign_set_up'
end
