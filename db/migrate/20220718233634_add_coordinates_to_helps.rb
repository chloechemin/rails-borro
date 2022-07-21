class AddCoordinatesToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :latitude, :float
    add_column :helps, :longitude, :float
  end
end
