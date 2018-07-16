class CreateBlueDarts < ActiveRecord::Migration[5.1]
  def change
    create_table :blue_darts do |t|

      t.timestamps
    end
  end
end
