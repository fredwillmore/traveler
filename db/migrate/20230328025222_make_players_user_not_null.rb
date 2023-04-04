class MakePlayersUserNotNull < ActiveRecord::Migration[7.0]
  def change
    Player.where(user_id: nil).delete_all

    change_column_null :players, :user_id, false
  end
end
