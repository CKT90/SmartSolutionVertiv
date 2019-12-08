class RemoveAddressFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :address, :text
  end
end
