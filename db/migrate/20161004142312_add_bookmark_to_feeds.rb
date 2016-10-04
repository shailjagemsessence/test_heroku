class AddBookmarkToFeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :feeds, :bookmark, :boolean
  end
end
