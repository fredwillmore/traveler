class Challenge < ActiveRecord::Base
  belongs_to :curriculum_area
  translates :challenge_text
end
