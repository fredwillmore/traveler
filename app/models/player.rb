class Player < ActiveRecord::Base
  has_one :user
  has_many :player_quantities
  has_many :quantities, :through => :player_quantities
end
