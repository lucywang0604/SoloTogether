class AddInfoToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :birthdate, :date
    add_column :profiles, :sex, :string
    add_column :profiles, :hobbies, :string, array: true, default: []
    add_column :profiles, :spoken_languages, :string, array: true, default: []
  end
end
