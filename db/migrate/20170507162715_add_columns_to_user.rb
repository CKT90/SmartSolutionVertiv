class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :contacts, :integer
    add_column :users, :address, :text
  end
end
