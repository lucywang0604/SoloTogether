class ChangeBiographyFromStringToText < ActiveRecord::Migration[7.1]
  def change
    change_column :profiles, :biography, :text
  end
end
