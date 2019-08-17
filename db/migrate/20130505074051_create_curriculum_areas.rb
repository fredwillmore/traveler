class CreateCurriculumAreas < ActiveRecord::Migration[4.2]
  def self.up
    create_table :curriculum_areas do |t|
      t.string :title
      t.timestamps
    end
    CurriculumArea.create_translation_table! :title => :string
  end
  def self.down
    drop_table :curriculum_areas
    CurriculumArea.drop_translation_table!
  end
end
