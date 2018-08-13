class AddUserRefToCharges < ActiveRecord::Migration[5.1]
  def change
    add_reference :charges, :user, foreign_key: true
    add_column :charges, :amount, :integer
    add_column :charges, :card_last4, :string
    add_column :charges, :card_type, :string
    add_column :charges, :card_exp_month, :string
    add_column :charges, :card_exp_year, :string
  end
end
