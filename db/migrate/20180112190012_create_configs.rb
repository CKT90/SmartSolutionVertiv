class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :project
      t.integer :rack_q
      t.text :comment
      t.integer :user_id
      t.string :number

      t.timestamps null: false
    end
  end
end
