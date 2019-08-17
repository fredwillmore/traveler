class CreateActionTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :action_types do |t|
      t.string      :name
      t.timestamps
    end
  end
end
