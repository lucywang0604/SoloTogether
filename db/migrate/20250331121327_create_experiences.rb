class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.string :city
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :price
      t.integer :duration
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
