class AddTokensToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :provider, :string
    add_column :sellers, :uid, :string
    add_column :sellers, :tokens, :text
  end
end
