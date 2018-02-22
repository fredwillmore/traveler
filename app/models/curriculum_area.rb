
class CurriculumArea < ActiveRecord::Base
  has_many :challenges
  # translates :title
end
