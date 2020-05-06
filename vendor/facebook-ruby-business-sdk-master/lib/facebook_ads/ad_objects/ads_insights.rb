# Copyright (c) 2017-present, Facebook, Inc. All rights reserved.
#
# You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
# copy, modify, and distribute this software in source code or binary form for use
# in connection with the web services and APIs provided by Facebook.
#
# As with any software that integrates with the Facebook platform, your use of
# this software is subject to the Facebook Platform Policy
# [http://developers.facebook.com/policy/]. This copyright notice shall be
# included in all copies or substantial portions of the software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# FB:AUTOGEN

module FacebookAds
  # This class is auto-generated.

  # For any issues or feature requests related to this class, please let us know
  # on github and we'll fix in our codegen framework. We'll not be able to accept
  # pull request for this class.

  class AdsInsights < AdObject
    ACTION_ATTRIBUTION_WINDOWS = [
      "1d_click",
      "1d_view",
      "28d_click",
      "28d_view",
      "7d_click",
      "7d_view",
      "default",
    ]

    ACTION_BREAKDOWNS = [
      "action_canvas_component_name",
      "action_carousel_card_id",
      "action_carousel_card_name",
      "action_destination",
      "action_device",
      "action_reaction",
      "action_target_id",
      "action_type",
      "action_video_sound",
      "action_video_type",
    ]

    ACTION_REPORT_TIME = [
      "conversion",
      "impression",
    ]

    BREAKDOWNS = [
      "ad_format_asset",
      "age",
      "body_asset",
      "call_to_action_asset",
      "country",
      "description_asset",
      "device_platform",
      "dma",
      "frequency_value",
      "gender",
      "hourly_stats_aggregated_by_advertiser_time_zone",
      "hourly_stats_aggregated_by_audience_time_zone",
      "image_asset",
      "impression_device",
      "link_url_asset",
      "place_page_id",
      "platform_position",
      "product_id",
      "publisher_platform",
      "region",
      "title_asset",
      "video_asset",
    ]

    DATE_PRESET = [
      "last_14d",
      "last_28d",
      "last_30d",
      "last_3d",
      "last_7d",
      "last_90d",
      "last_month",
      "last_quarter",
      "last_week_mon_sun",
      "last_week_sun_sat",
      "last_year",
      "lifetime",
      "this_month",
      "this_quarter",
      "this_week_mon_today",
      "this_week_sun_today",
      "this_year",
      "today",
      "yesterday",
    ]

    LEVEL = [
      "account",
      "ad",
      "adset",
      "campaign",
    ]

    SUMMARY_ACTION_BREAKDOWNS = [
      "action_canvas_component_name",
      "action_carousel_card_id",
      "action_carousel_card_name",
      "action_destination",
      "action_device",
      "action_reaction",
      "action_target_id",
      "action_type",
      "action_video_sound",
      "action_video_type",
    ]


    field :account_currency, 'string'
    field :account_id, 'string'
    field :account_name, 'string'
    field :action_values, { list: 'AdsActionStats' }
    field :actions, { list: 'AdsActionStats' }
    field :actions_per_impression, 'string'
    field :actions_results, 'AdsActionStats'
    field :activity_recency, 'string'
    field :ad_bid_type, 'string'
    field :ad_bid_value, 'string'
    field :ad_click_actions, { list: 'AdsActionStats' }
    field :ad_delivery, 'string'
    field :ad_format_asset, 'string'
    field :ad_id, 'string'
    field :ad_impression_actions, { list: 'AdsActionStats' }
    field :ad_name, 'string'
    field :adset_bid_type, 'string'
    field :adset_bid_value, 'string'
    field :adset_budget_type, 'string'
    field :adset_budget_value, 'string'
    field :adset_delivery, 'string'
    field :adset_end, 'string'
    field :adset_id, 'string'
    field :adset_name, 'string'
    field :adset_start, 'string'
    field :age, 'string'
    field :age_targeting, 'string'
    field :amount_in_catalog_currency, { list: 'AdsActionStats' }
    field :app_store_clicks, 'string'
    field :attention_events_per_impression, 'string'
    field :attention_events_unq_per_reach, 'string'
    field :auction_bid, 'string'
    field :auction_competitiveness, 'string'
    field :auction_max_competitor_bid, 'string'
    field :body_asset, 'object'
    field :buying_type, 'string'
    field :call_to_action_asset, 'object'
    field :call_to_action_clicks, 'string'
    field :campaign_delivery, 'string'
    field :campaign_end, 'string'
    field :campaign_id, 'string'
    field :campaign_name, 'string'
    field :campaign_start, 'string'
    field :cancel_subscription_actions, { list: 'AdsActionStats' }
    field :canvas_avg_view_percent, 'string'
    field :canvas_avg_view_time, 'string'
    field :card_views, 'string'
    field :catalog_segment_actions, { list: 'AdsActionStats' }
    field :catalog_segment_value_in_catalog_currency, { list: 'AdsActionStats' }
    field :catalog_segment_value_mobile_purchase_roas, { list: 'AdsActionStats' }
    field :catalog_segment_value_website_purchase_roas, { list: 'AdsActionStats' }
    field :clicks, 'string'
    field :conditional_time_spent_ms_over_10s_actions, { list: 'AdsActionStats' }
    field :conditional_time_spent_ms_over_15s_actions, { list: 'AdsActionStats' }
    field :conditional_time_spent_ms_over_2s_actions, { list: 'AdsActionStats' }
    field :conditional_time_spent_ms_over_3s_actions, { list: 'AdsActionStats' }
    field :conditional_time_spent_ms_over_6s_actions, { list: 'AdsActionStats' }
    field :contact_actions, { list: 'AdsActionStats' }
    field :contact_value, { list: 'AdsActionStats' }
    field :conversion_rate_ranking, 'string'
    field :conversion_values, { list: 'AdsActionStats' }
    field :conversions, { list: 'AdsActionStats' }
    field :cost_per_15_sec_video_view, { list: 'AdsActionStats' }
    field :cost_per_2_sec_continuous_video_view, { list: 'AdsActionStats' }
    field :cost_per_action_result, 'AdsActionStats'
    field :cost_per_action_type, { list: 'AdsActionStats' }
    field :cost_per_ad_click, { list: 'AdsActionStats' }
    field :cost_per_completed_video_view, { list: 'AdsActionStats' }
    field :cost_per_contact, { list: 'AdsActionStats' }
    field :cost_per_conversion, { list: 'AdsActionStats' }
    field :cost_per_customize_product, { list: 'AdsActionStats' }
    field :cost_per_dda_countby_convs, 'string'
    field :cost_per_donate, { list: 'AdsActionStats' }
    field :cost_per_dwell, 'string'
    field :cost_per_dwell_3_sec, 'string'
    field :cost_per_dwell_5_sec, 'string'
    field :cost_per_dwell_7_sec, 'string'
    field :cost_per_estimated_ad_recallers, 'string'
    field :cost_per_find_location, { list: 'AdsActionStats' }
    field :cost_per_inline_link_click, 'string'
    field :cost_per_inline_post_engagement, 'string'
    field :cost_per_one_thousand_ad_impression, { list: 'AdsActionStats' }
    field :cost_per_outbound_click, { list: 'AdsActionStats' }
    field :cost_per_schedule, { list: 'AdsActionStats' }
    field :cost_per_start_trial, { list: 'AdsActionStats' }
    field :cost_per_submit_application, { list: 'AdsActionStats' }
    field :cost_per_subscribe, { list: 'AdsActionStats' }
    field :cost_per_thruplay, { list: 'AdsActionStats' }
    field :cost_per_total_action, 'string'
    field :cost_per_unique_action_type, { list: 'AdsActionStats' }
    field :cost_per_unique_click, 'string'
    field :cost_per_unique_conversion, { list: 'AdsActionStats' }
    field :cost_per_unique_inline_link_click, 'string'
    field :cost_per_unique_outbound_click, { list: 'AdsActionStats' }
    field :country, 'string'
    field :cpc, 'string'
    field :cpm, 'string'
    field :cpp, 'string'
    field :created_time, 'string'
    field :creative_fingerprint, 'string'
    field :ctr, 'string'
    field :customize_product_actions, { list: 'AdsActionStats' }
    field :customize_product_value, { list: 'AdsActionStats' }
    field :date_start, 'string'
    field :date_stop, 'string'
    field :dda_countby_convs, 'string'
    field :deduping_1st_source_ratio, 'string'
    field :deduping_2nd_source_ratio, 'string'
    field :deduping_3rd_source_ratio, 'string'
    field :deduping_ratio, 'string'
    field :deeplink_clicks, 'string'
    field :description_asset, 'object'
    field :device_platform, 'string'
    field :dma, 'string'
    field :donate_actions, { list: 'AdsActionStats' }
    field :donate_value, { list: 'AdsActionStats' }
    field :dwell_3_sec, 'string'
    field :dwell_5_sec, 'string'
    field :dwell_7_sec, 'string'
    field :dwell_rate, 'string'
    field :earned_impression, 'string'
    field :engagement_rate_ranking, 'string'
    field :estimated_ad_recall_rate, 'string'
    field :estimated_ad_recall_rate_lower_bound, 'string'
    field :estimated_ad_recall_rate_upper_bound, 'string'
    field :estimated_ad_recallers, 'string'
    field :estimated_ad_recallers_lower_bound, 'string'
    field :estimated_ad_recallers_upper_bound, 'string'
    field :find_location_actions, { list: 'AdsActionStats' }
    field :find_location_value, { list: 'AdsActionStats' }
    field :frequency, 'string'
    field :frequency_value, 'string'
    field :full_view_impressions, 'string'
    field :full_view_reach, 'string'
    field :gender, 'string'
    field :gender_targeting, 'string'
    field :hourly_stats_aggregated_by_advertiser_time_zone, 'string'
    field :hourly_stats_aggregated_by_audience_time_zone, 'string'
    field :image_asset, 'object'
    field :impression_device, 'string'
    field :impressions, 'string'
    field :impressions_auto_refresh, 'string'
    field :impressions_gross, 'string'
    field :inline_link_click_ctr, 'string'
    field :inline_link_clicks, 'string'
    field :inline_post_engagement, 'string'
    field :instant_experience_clicks_to_open, 'string'
    field :instant_experience_clicks_to_start, 'string'
    field :instant_experience_outbound_clicks, 'string'
    field :interactive_component_tap, { list: 'AdsActionStats' }
    field :labels, 'string'
    field :link_url_asset, 'object'
    field :location, 'string'
    field :media_asset, 'object'
    field :mobile_app_purchase_roas, { list: 'AdsActionStats' }
    field :newsfeed_avg_position, 'string'
    field :newsfeed_clicks, 'string'
    field :newsfeed_impressions, 'string'
    field :objective, 'string'
    field :optimization_goal, 'string'
    field :outbound_clicks, { list: 'AdsActionStats' }
    field :outbound_clicks_ctr, { list: 'AdsActionStats' }
    field :performance_indicator, 'string'
    field :place_page_id, 'string'
    field :place_page_name, 'string'
    field :placement, 'string'
    field :platform_position, 'string'
    field :product_id, 'string'
    field :publisher_platform, 'string'
    field :purchase_roas, { list: 'AdsActionStats' }
    field :quality_ranking, 'string'
    field :quality_score_ectr, 'string'
    field :quality_score_ecvr, 'string'
    field :quality_score_organic, 'string'
    field :reach, 'string'
    field :recurring_subscription_payment_actions, { list: 'AdsActionStats' }
    field :region, 'string'
    field :rule_asset, 'object'
    field :schedule_actions, { list: 'AdsActionStats' }
    field :schedule_value, { list: 'AdsActionStats' }
    field :social_spend, 'string'
    field :spend, 'string'
    field :start_trial_actions, { list: 'AdsActionStats' }
    field :start_trial_value, { list: 'AdsActionStats' }
    field :submit_application_actions, { list: 'AdsActionStats' }
    field :submit_application_value, { list: 'AdsActionStats' }
    field :subscribe_actions, { list: 'AdsActionStats' }
    field :subscribe_value, { list: 'AdsActionStats' }
    field :thumb_stops, 'string'
    field :title_asset, 'object'
    field :today_spend, 'string'
    field :total_action_value, 'string'
    field :total_actions, 'string'
    field :total_unique_actions, 'string'
    field :unique_actions, { list: 'AdsActionStats' }
    field :unique_clicks, 'string'
    field :unique_conversions, { list: 'AdsActionStats' }
    field :unique_ctr, 'string'
    field :unique_impressions, 'string'
    field :unique_inline_link_click_ctr, 'string'
    field :unique_inline_link_clicks, 'string'
    field :unique_link_clicks_ctr, 'string'
    field :unique_outbound_clicks, { list: 'AdsActionStats' }
    field :unique_outbound_clicks_ctr, { list: 'AdsActionStats' }
    field :unique_video_continuous_2_sec_watched_actions, { list: 'AdsActionStats' }
    field :unique_video_view_15_sec, { list: 'AdsActionStats' }
    field :updated_time, 'string'
    field :video_15_sec_watched_actions, { list: 'AdsActionStats' }
    field :video_30_sec_watched_actions, { list: 'AdsActionStats' }
    field :video_asset, 'object'
    field :video_avg_time_watched_actions, { list: 'AdsActionStats' }
    field :video_complete_watched_actions, { list: 'AdsActionStats' }
    field :video_completed_view_or_15s_passed_actions, { list: 'AdsActionStats' }
    field :video_continuous_2_sec_watched_actions, { list: 'AdsActionStats' }
    field :video_p100_watched_actions, { list: 'AdsActionStats' }
    field :video_p25_watched_actions, { list: 'AdsActionStats' }
    field :video_p50_watched_actions, { list: 'AdsActionStats' }
    field :video_p75_watched_actions, { list: 'AdsActionStats' }
    field :video_p95_watched_actions, { list: 'AdsActionStats' }
    field :video_play_actions, { list: 'AdsActionStats' }
    field :video_play_curve_actions, { list: 'object' }
    field :video_play_retention_0_to_15s_actions, { list: 'object' }
    field :video_play_retention_20_to_60s_actions, { list: 'object' }
    field :video_play_retention_graph_actions, { list: 'object' }
    field :video_thruplay_watched_actions, { list: 'AdsActionStats' }
    field :video_time_watched_actions, { list: 'AdsActionStats' }
    field :website_clicks, 'string'
    field :website_ctr, { list: 'AdsActionStats' }
    field :website_purchase_roas, { list: 'AdsActionStats' }
    field :wish_bid, 'string'
    has_no_id
    has_no_get
    has_no_post
    has_no_delete

  end
end
