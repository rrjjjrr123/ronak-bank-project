# add email to bluedart
class AddemailToBlueDart < ActiveRecord::Migration[5.1]
  def change
    add_column :blue_darts, :email, :string
  end
end
