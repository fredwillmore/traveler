class RenameColumnPlayerSexToGender < ActiveRecord::Migration[7.0]
  def change
    rename_column :players, :sex, :gender
  end
end
