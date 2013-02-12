class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :challenge_type_id
      t.integer :level

      t.timestamps
    end
  end
end
