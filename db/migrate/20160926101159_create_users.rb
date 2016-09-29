class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.integer :contact_no
      t.string  :password
      t.date    :dob

      t.timestamps
    end
  end
end
