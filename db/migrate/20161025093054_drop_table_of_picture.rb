class DropTableOfPicture < ActiveRecord::Migration[5.0]
  def change
    drop_table :pictures
  end
end
