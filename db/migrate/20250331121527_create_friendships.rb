class CreateFriendships < ActiveRecord::Migration[7.1]
  def change
    create_table :friendships do |t|
      t.integer :profile_id_one
      t.integer :profile_id_two

      t.timestamps
    end
  end
end
