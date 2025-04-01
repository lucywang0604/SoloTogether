class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.references :city, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
