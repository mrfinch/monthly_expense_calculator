class AddActiveToExpenseModel < ActiveRecord::Migration
  def change
    add_column :expenses, :active, :boolean, default: true
    add_index :expenses, :active
  end
end
