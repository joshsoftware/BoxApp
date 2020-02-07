class AddLevelCitySportRefToUserCitySport < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_city_sports, :level_city_sports, foreign_key: true
    remove_column :user_city_sports, :level, :integer
  end
end
