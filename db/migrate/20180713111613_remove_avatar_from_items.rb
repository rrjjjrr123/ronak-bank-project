class RemoveAvatarFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :avatar, :string
  end
end
