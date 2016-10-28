class RemoveFriendIdFormUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :friend_id, :integer
  end
end
