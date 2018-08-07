class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number
      t.string :balance, default: 0.00
      t.belongs_to :user
      t.timestamps
    end
  end
end
