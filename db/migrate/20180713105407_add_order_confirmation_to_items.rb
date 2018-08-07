class AddOrderConfirmationToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :order_confirmation, :boolean, default: false
  end
end
