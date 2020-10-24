class AddColumnsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :latitude, :decimal, precision: 10, scale: 6
    add_column :rooms, :longitude, :decimal, precision: 10, scale: 6
  end
end
