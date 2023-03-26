class MakePlayerStateDefaultNormal < ActiveRecord::Migration[7.0]
  def up
    change_column_default :players, :state, from: nil, to: :normal, null: false
    Player.update_all(state: :normal)
    change_column_null :players, :state, false 
  end

  def down
    change_column_default :players, :state, from: :normal, to: nil
    change_column_null :players, :state, true
  end
end
