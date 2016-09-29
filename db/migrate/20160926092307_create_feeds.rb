class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.binary  :image
      t.text    :body
      t.integer :user_id
      t.string  :permission
      
      t.timestamps
    end
  end
end
       
      

