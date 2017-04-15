class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name, index: true, null: false
      t.float :cost, index: true, null: false
      t.datetime :made_on, index: true, null: false

      t.timestamps :null => false

      t.references :user, index: true, foreign_key: true

      t.index :created_at
      t.index :updated_at
    end
  end
end
