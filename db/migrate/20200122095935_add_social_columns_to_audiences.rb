class AddSocialColumnsToAudiences < ActiveRecord::Migration[5.2]
  def change
    add_column :audiences, :page_id, :string
    add_column :audiences, :description, :text
  end
end
