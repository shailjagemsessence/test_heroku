class CreateBookmarkTables < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmark_tables do |t|
      t.integer :user_id
      t.integer :feed_id

      t.timestamps
    end
  end
end
