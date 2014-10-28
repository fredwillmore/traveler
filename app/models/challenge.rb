class Challenge < ActiveRecord::Base
  belongs_to :curriculum_area
  translates :challenge_text
  # attr_accessible :target_text, :challenge_text, :curriculum_area_id, :level, :challenge_type_id,
  #                 :id, :created_at, :updated_at # these too?
end
