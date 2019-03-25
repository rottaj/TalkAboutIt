class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :bio
      t.string :user_name
      t.string :status
      t.string :location
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
