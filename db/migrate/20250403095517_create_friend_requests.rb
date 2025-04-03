class CreateFriendRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_requests do |t|
      t.references :sender, null: false, foreign_key: { to_table: :profiles }
      t.references :receiver, null: false, foreign_key: { to_table: :profiles }
      t.string :status, default: 'pending'
      t.timestamps
    end

    add_index :friend_requests, [:sender_id, :receiver_id], unique: true
  end
end
