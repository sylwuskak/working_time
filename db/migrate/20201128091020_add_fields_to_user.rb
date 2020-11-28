class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :salary, :float
    add_column :users, :hours_number, :float
    add_column :users, :hours_by_month, :integer
  end
end
