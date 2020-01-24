class CreateLevelCitySports < ActiveRecord::Migration[5.2]
  def change
    create_table :level_city_sports do |t|
      t.references :level
      t.references :city_sport
      t.timestamps
    end
  end
end
