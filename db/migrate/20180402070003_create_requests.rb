class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.date :birthdate
      t.string :email
      t.string :password
      t.string :image

      t.timestamps
    end
  end
end
