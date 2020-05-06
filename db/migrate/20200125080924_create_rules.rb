class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :evaluation_spec
      t.string :status
      t.string :fb_rule_id
      t.string :schedule_spec
      t.string :name
      t.string :entity_type
      t.integer :filter_value
      t.string :time_preset
      t.string :filter_field
      t.string :filter_operation
      t.string :evaluation_type
      t.string :insight
      t.string :attribution_window
      t.integer :value
      t.string :operator

      t.timestamps
    end
  end
end
