class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :location_id
      t.integer :level
      t.string :sex
      t.timestamp :dob
      t.string :occupation
      t.integer :energy
      t.integer :food
      t.integer :water
      t.integer :bio
      t.integer :money
      t.integer :confidence
      t.integer :attractiveness
      t.integer :charisma
      t.integer :status
      t.integer :intelligence
      t.integer :luck

      t.timestamps
    end
  end
end
