class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :biography
      t.string :mode
      t.references :current_city, null: true, foreign_key: { to_table: :cities }
      t.references :original_city, null: true, foreign_key: { to_table: :cities }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
