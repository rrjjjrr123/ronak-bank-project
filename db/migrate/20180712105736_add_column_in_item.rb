class AddColumnInItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :avatar, :string
  end
end
