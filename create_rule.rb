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
require 'byebug'
require 'facebook_ads'

access_token = 'EAAQmKM9i1iwBAHihP3JfhIAow4mr7ONbIedZBdCWHNQ5nlCOQrbQ51SnZCh7DCy8wI8lSTOLLW210xfnO1ZBxpqlofHgdMmQd6dYJYaDvuKfNfpCHRse2ZBJxioo42KBcoXWR4FwmmKuUypKkQzR3MNLww4er7ZAWfnZBylvWHmorBWweuVXjCJwCfSoolu20ZD'
app_secret = 'aebf1e5939952ea3b9c3357abb24ccc7'
ad_account_id = 'act_568084930708476'
# access_token = 'EAAQmKM9i1iwBAGB8mZAFLqNOw2dhCZAjZAs3e37g5n46wUmC1w3QZB50FP2KG7M12AnVugyBY1IC0pEFbsDVlo160PCZBNRc39YZAxorVz8JBLVDTp0E0ef1ON9p9ggHxqsM3yd8AOhTDSxHxByeynoWTaWCBPHGz8J7oeyfABoEgPsciUe2bP46IDISAejrMZD'
# app_secret = 'aebf1e5939952ea3b9c3357abb24ccc7'
# ad_account_id = 'act_568084930708476'
schedule_interval = 'DAILY'
entity_type = 'CAMPAIGN'
notification_user_id = '521209365411560'
filter_field = 'impressions'
filter_value = '1'
filter_operator = 'GREATER_THAN'
app_id = '1167856626751020'

FacebookAds.configure do |config|
  config.access_token = access_token
  config.app_secret = app_secret
end

ad_account = FacebookAds::AdAccount.get(ad_account_id)
ad_account.adrules_library.create({
    execution_spec: { 'execution_type': 'NOTIFICATION', 'execution_options': [ { 'field': 'user_ids', 'value': [notification_user_id], 'operator': 'EQUAL' } ] },
    name: 'Sample SDK Rule from code',
    schedule_spec: { 'schedule_type': schedule_interval },
    evaluation_spec: { 'evaluation_type': 'SCHEDULE', 'filters': [ { 'field': filter_field, 'value': filter_value, 'operator': filter_operator }, { 'field': 'entity_type', 'value': entity_type, 'operator': 'EQUAL' }, { 'field': 'time_preset', 'value': 'LIFETIME', 'operator': 'EQUAL' } ] },
})
puts  "#{ad_account.adrules_library}"