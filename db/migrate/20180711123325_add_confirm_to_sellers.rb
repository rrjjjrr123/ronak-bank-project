class AddConfirmToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :confirmed_at, :datetime
  end
end
