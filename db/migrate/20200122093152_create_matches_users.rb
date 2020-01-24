class CreateMatchesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :matches_users, id: false do |t|
      t.belongs_to :match
      t.belongs_to :user
    end
  end
end
