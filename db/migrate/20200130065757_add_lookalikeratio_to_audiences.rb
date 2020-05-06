class AddLookalikeratioToAudiences < ActiveRecord::Migration[5.2]
  def change
    add_column :audiences, :starting_ratio, :string
  end
end
