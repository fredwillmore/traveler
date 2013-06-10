class Quantity < ActiveRecord::Base
  has_many :player_quantities
  has_many :players, :through => :player_quantities
end
