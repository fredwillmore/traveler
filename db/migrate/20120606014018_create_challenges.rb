class CreateChallenges < ActiveRecord::Migration[4.2]
  def self.up
    create_table :challenges do |t|
      t.integer :challenge_type_id
      t.integer :curriculum_area_id
      t.integer :level
      t.text :challenge_text
      t.timestamps
    end
    Challenge.create_translation_table! :challenge_text => :text
  end
  def self.down
    drop_table :challenges
    Challenge.drop_translation_table!
  end
end
