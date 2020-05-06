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

require 'facebookbusiness'
require 'facebook_ads'
require 'byebug'
access_token = 'EAAQmKM9i1iwBAHihP3JfhIAow4mr7ONbIedZBdCWHNQ5nlCOQrbQ51SnZCh7DCy8wI8lSTOLLW210xfnO1ZBxpqlofHgdMmQd6dYJYaDvuKfNfpCHRse2ZBJxioo42KBcoXWR4FwmmKuUypKkQzR3MNLww4er7ZAWfnZBylvWHmorBWweuVXjCJwCfSoolu20ZD'
app_secret = 'aebf1e5939952ea3b9c3357abb24ccc7'
ad_account_id = 'act_568084930708476'
audience_name = 'test audience from code'
audience_retention_days = '30'
pixel_id = '2434201416894708'
app_id = '1167856626751020'

FacebookAds.configure do |config|
  config.access_token = access_token
  config.app_secret = app_secret
end

ad_account = FacebookAds::AdAccount.get(ad_account_id)

campaign = ad_account.campaigns.create({
    objective: 'LINK_CLICKS',
    special_ad_category: 'NONE',
    status: 'PAUSED',
    buying_type: 'AUCTION',
    name: 'My Campaign new',
})
campaign_id = campaign.id
print 'campaign_id:', campaign_id
custom_audience = ad_account.customaudiences.create({
    name: audience_name,
    pixel_id: pixel_id,
    prefill: true,
    rule: {'url':{'i_contains':''}},
    subtype: 'WEBSITE',
    retention_days: audience_retention_days,
})

custom_audience_id = custom_audience.id
print 'custom_audience_id:', custom_audience_id
ad_set = ad_account.adsets.create({
    status: 'PAUSED',
    targeting: {'custom_audiences':[{'id':custom_audience_id}], 'geo_locations':{'countries':['US']}},
    name: 'My AdSet',
    billing_event: 'IMPRESSIONS',
    bid_amount: '20',
    campaign_id: campaign_id,
    optimization_goal: 'REACH',
    daily_budget: '1000',
})
ad_set_id = ad_set.id
print 'ad_set_id:', ad_set_id

creative = ad_account.adcreatives.create({
    body: 'Like My Page',
    name: 'My Creative',
    title: 'My Page Like Ad',
    object_url: 'www.facebook.com',
    link_url: 'www.facebook.com',
    image_url: 'http://www.facebookmarketingdevelopers.com/static/images/resource_1.jpg',
})
creative_id = creative.id
print 'creative_id:', creative_id
ad = ad_account.ads.create({
    status: 'PAUSED',
    adset_id: ad_set_id,
    name: 'My Ad',
    creative: {'creative_id':creative_id},
})
ad_id = ad.id
print 'ad_id:', ad_id
ad = FacebookAds::Ad.get(ad_id)
ad.previews({
    ad_format: 'DESKTOP_FEED_STANDARD',
})
