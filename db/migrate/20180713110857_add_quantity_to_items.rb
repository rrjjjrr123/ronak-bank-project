class AddQuantityToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :qunatity, :integer
  end
end
