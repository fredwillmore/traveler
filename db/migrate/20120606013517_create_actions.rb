class CreateActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.integer :action_type_id
      t.integer :reward_id
      t.integer :risk_id
      t.integer :challenge_id

      t.timestamps
    end
  end
end
