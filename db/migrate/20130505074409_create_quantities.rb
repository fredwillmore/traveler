class CreateQuantities < ActiveRecord::Migration[4.2]
  def change
    create_table :quantities do |t|
      t.string :name
      t.float :value
    end
  end
end
