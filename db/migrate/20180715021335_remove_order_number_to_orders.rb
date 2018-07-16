class RemoveOrderNumberToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :order_number, :bigint
  end
end
