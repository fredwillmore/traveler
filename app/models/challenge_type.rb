class ChallengeType < ActiveRecord::Base
  has_and_belongs_to_many :challenges
end
