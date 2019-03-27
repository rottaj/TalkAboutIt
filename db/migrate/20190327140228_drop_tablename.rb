class DropTablename < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_badges
    drop_table :badges

  end
end
