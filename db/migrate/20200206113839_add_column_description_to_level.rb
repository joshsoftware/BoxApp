class AddColumnDescriptionToLevel < ActiveRecord::Migration[6.0]
  def change
    add_column :levels, :description, :string
  end
end
