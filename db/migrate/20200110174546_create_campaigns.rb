class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :objective
      t.string :special_ad_category
      t.string :status
      t.string :name
      t.string :buying_type
      t.string :campaign_id
      t.string :daily_budget

      t.timestamps
    end
  end
end
