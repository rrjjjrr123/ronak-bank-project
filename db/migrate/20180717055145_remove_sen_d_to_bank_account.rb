class RemoveSenDToBankAccount < ActiveRecord::Migration[5.1]
  def change
    remove_column :bank_accounts, :send_account_number_confirmation, :string
    remove_column :bank_accounts, :send_account_number, :string
  end
end
