class CreateVisitedCities < ActiveRecord::Migration[7.1]
  def change
    create_table :visited_cities do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
