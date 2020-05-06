class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :my_score
      t.string :cost_value
      t.string :pay_value
      t.string :subscription_type
      t.string :start_date
      t.string :end_date
      t.boolean :agree
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
