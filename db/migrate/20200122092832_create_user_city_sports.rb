class CreateUserCitySports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_city_sports do |t|
      t.references :user
      t.references :city_sport
      t.integer :monthly_points
      t.integer :total_points
      t.integer :level
      t.boolean :is_waiting 
      t.boolean :is_active
      t.timestamps
    end
  end
end
