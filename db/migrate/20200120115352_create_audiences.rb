class CreateAudiences < ActiveRecord::Migration[5.2]
  def change
    create_table :audiences do |t|
      t.string :name
      t.string :pixel_id
      t.string :audience_type
      t.string :retention_seconds
      t.string :value
      t.string :customaudience_id
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
