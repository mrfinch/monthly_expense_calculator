class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users, bulk: true do |t|
      t.string :name, null: true
      t.string :phone, null: true
      t.string :currency, null: true
      t.string :profile_image, null: true

      t.index :created_at
      t.index :updated_at
    end
  end
end
