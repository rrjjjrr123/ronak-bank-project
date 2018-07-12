class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :user
      t.boolean  :permanent ,default: false
      t.integer  :house_no
      t.integer  :street_no
      t.string   :area
      t.string   :city 
      t.string   :state 
      t.string   :country
      t.integer  :pin
      t.timestamps
    end
  end
end
