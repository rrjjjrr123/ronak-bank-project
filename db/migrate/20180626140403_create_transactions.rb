class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :credit_bank_account 
      t.references :debit_bank_account
      t.string     :amount
      t.belongs_to  :bank_account
      t.integer     :status ,default: 0 
      t.timestamps
    end
  end
end
