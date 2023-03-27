class UserAction < ActiveRecord::Base
  belongs_to :action_type
  belongs_to :reward
  # belongs_to :risk
  belongs_to :challenge
end
