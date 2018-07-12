class AddColumsToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :confirmation_token, :string
    add_column :sellers, :confirmation_sent_at, :datetime
  end
end
