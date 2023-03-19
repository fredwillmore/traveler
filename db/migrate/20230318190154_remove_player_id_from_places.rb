class RemovePlayerIdFromPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :player_id
  end
end
