class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :strip_id, :string
    add_column :users, :stripe_subscribe_id, :string
    add_column :users, :card_last_4, :string
    add_column :users, :card_exp_month, :integer
    add_column :users, :card_exp_year, :integer
    add_column :users, :card_type, :string
  end
end
