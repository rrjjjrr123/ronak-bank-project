class AddColumnToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :unconfirmed_email, :string
  end
end
<<<<<<< HEAD
  
=======
>>>>>>> 07e072873bb9a5a81f41dbb145d4e87de7b0c867
