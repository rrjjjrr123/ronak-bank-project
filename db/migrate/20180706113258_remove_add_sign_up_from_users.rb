class RemoveAddSignUpFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin_sign_up, :string
  end
end
