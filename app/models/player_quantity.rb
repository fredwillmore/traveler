class PlayerQuantity < ActiveRecord::Base
  belongs_to :player
  belongs_to :quantity
end
