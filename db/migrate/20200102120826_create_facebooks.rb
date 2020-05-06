class CreateFacebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :facebooks do |t|
      t.bigint :fb_user_id
      t.string :fb_access_token
      t.bigint :fb_business_account_id

      t.timestamps
    end
  end
end