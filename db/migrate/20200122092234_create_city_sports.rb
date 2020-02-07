class CreateCitySports < ActiveRecord::Migration[5.2]
  def change
    create_table :city_sports do |t|
      t.references :city
      t.references :sport
      t.integer :number_of_boxes
      t.integer :number_of_players
      t.timestamps
    end
  end
end
