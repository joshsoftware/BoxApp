class AddColumnDescriptionToLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :description, :string
  end
end
