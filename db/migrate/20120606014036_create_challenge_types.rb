class CreateChallengeTypes < ActiveRecord::Migration
  def change
    create_table :challenge_types do |t|

      t.timestamps
    end
  end
end
