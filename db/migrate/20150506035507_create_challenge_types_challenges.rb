class CreateChallengeTypesChallenges < ActiveRecord::Migration
  def change
    create_table :challenge_types_challenges do |t|
      t.integer :challenge_type_id
      t.integer :challenge_id
    end
  end
end
