class AddCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :text
  end
end
