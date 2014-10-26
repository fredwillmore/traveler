class Location < ActiveRecord::Base
  belongs_to :place
  has_one :player
end
