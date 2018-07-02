class CreateOtps < ActiveRecord::Migration[5.1]
  def change
    create_table :otps do |t|
      t.boolean :status ,default: true  
      t.string :otp
      t.belongs_to :transaction
      t.timestamps
    end
  end
end
