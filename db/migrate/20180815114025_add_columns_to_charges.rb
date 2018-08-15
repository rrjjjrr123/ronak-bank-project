class AddColumnsToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :amount, :integer
    add_column :charges, :card_last_4, :string
    add_column :charges, :card_exp_month, :integer
    add_column :charges, :card_exp_year, :integer
    add_column :charges, :card_type, :string
  end
end
