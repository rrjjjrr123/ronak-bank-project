class CreateAccountTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :account_transactions do |t|
      t.float :amount
      t.string :transaction_type
      t.string :transaction_number

      t.timestamps
    end
  end
end
