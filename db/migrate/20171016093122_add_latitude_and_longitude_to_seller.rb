class AddLatitudeAndLongitudeToSeller < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :latitude, :float
    add_column :sellers, :longitude, :float
  end
end
