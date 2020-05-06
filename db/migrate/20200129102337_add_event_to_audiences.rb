class AddEventToAudiences < ActiveRecord::Migration[5.2]
  def change
    add_column :audiences, :field, :string
    add_column :audiences, :event, :string
    add_column :audiences, :operator, :string
    add_column :audiences, :time, :string
  end
end
