class CreatePaypalPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :paypal_payments do |t|
      t.string :order_id
      t.string :full_name
      t.string :address_line_1
      t.string :admin_area_2
      t.string :admin_area_1
      t.bigint :postal_code
      t.string :country_code
      t.string :payment_id
      t.string :currency_code
      t.bigint :payment_amount

      t.timestamps
    end
  end
end
