class AddItemSelectToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :item_select, :string
    add_column :users, :confirmed, :boolean ,default: false
  end
end
