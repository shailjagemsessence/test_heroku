class AddBookmarkToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :mark_as, :boolean
  end
end
