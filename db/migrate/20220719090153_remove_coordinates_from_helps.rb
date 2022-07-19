class RemoveCoordinatesFromHelps < ActiveRecord::Migration[6.1]
  def change
    remove_column :helps, :latitude, :float
    remove_column :helps, :longitude, :float
  end
end
