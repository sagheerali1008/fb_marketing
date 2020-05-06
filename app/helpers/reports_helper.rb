module ReportsHelper
  # Get previews of all Adds
  def get_frames(parsed_ad_ids)
    @iframes = []
    parsed_ad_ids['data'].each do |ad_id|
      ad_preview = RestClient.get "https://graph.facebook.com/v6.0/#{ad_id['id']}/previews?ad_format=DESKTOP_FEED_STANDARD&access_token=#{ENV["FB_ACCESS_TOKEN"]}"
      parsed_ad_preview = JSON.parse ad_preview
      @iframes << parsed_ad_preview['data']
    end
    @iframe_all = []
    @iframes.each do |iframe_total|
      @iframe_all << iframe_total[0]['body']
    end
    @frame = []
    @iframe_all.each do |frame_show|
      @frame << frame_show.delete('\\"').split[1].split("src=")[1].remove("amp;")
    end
    return @frame
  end
end
