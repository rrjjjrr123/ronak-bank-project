class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.integer :account_number
      t.float :balance
      t.belongs_to :user
      t.timestamps
    end
  end
end
