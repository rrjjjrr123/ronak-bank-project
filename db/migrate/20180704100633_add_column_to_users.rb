class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_sign_up, :string
  end
end
