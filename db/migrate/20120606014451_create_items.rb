class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.integer :item_type_id
      t.integer :value

      t.timestamps
    end
  end
end
