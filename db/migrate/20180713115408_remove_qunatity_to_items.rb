class RemoveQunatityToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :qunatity, :integer
  end
end
