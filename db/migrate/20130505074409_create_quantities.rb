class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.string :name
      t.float :value
    end
  end
end
