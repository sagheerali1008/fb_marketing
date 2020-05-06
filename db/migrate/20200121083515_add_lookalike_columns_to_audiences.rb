class AddLookalikeColumnsToAudiences < ActiveRecord::Migration[5.2]
  def change
    add_column :audiences, :subtype, :string
    add_column :audiences, :origin_audience_id, :string
    add_column :audiences, :fb_type, :string
    add_column :audiences, :country, :string
    add_column :audiences, :fb_custom_ratio, :string
  end
end
