class CreateBeneficiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :beneficiaries do |t|
      t.integer :beneficiary_id
      t.belongs_to :user
      t.timestamps
    end
  end
end
