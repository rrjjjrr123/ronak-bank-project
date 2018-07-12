class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.bigint :order_number
      t.integer :status
      t.float :amount
      t.integer :quantity
      t.belongs_to :item
      t.timestamps
    end
  end
end
