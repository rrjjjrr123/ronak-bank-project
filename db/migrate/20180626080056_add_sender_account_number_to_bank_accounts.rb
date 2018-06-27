class AddSenderAccountNumberToBankAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :bank_accounts, :send_account_number, :string
  end
end
