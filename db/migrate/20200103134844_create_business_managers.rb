class CreateBusinessManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :business_managers do |t|
      t.bigint :business_account_id
      t.string :business_account_name

      t.timestamps
    end
  end
end