class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.string :stripe_id  
      t.timestamps
    end
  end 
end
