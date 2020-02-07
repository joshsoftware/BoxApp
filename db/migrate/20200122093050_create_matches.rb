class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :city_sport
      t.date :played_on
      t.integer :result
      t.timestamps
    end
  end
end
