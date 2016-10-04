class AlterColumnFeedPermission < ActiveRecord::Migration[5.0]
  def change
    change_column :feeds, :permission, :integer
  end
end