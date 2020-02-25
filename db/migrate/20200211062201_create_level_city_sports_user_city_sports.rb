class CreateLevelCitySportsUserCitySports < ActiveRecord::Migration[6.0]
  def change
    create_table :level_city_sports_user_city_sports, id: false do |t|
      t.belongs_to :level_city_sport
      t.belongs_to :user_city_sport
    end
  end
end
