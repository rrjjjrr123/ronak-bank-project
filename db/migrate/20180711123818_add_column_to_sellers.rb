class AddColumnToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :unconfirmed_email, :string
  end
end
  