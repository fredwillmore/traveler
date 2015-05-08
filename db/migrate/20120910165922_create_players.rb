class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :state
      t.integer :location_id
      t.integer :destination_id
      t.integer :level
      t.string :name
      t.string :sex
      t.timestamp :dob
      t.string :occupation
#      t.integer :energy
#      t.integer :food
#      t.integer :water
#      t.integer :bio
#      t.integer :money
#      t.integer :confidence
      t.integer :attractiveness
      t.integer :charisma
      t.integer :status
      t.integer :intelligence
      t.integer :luck

      t.string :base_locale
      t.string :target_locale
      t.string :target_dialect

      t.boolean :is_current_player
      t.timestamps
    end
  end
end
