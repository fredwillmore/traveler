class Player < ActiveRecord::Base
  has_one :user
  has_many :player_quantities
  has_many :quantities, :through => :player_quantities
  belongs_to :location

  state_machine :state, :initial => :normal do
    state :normal
    state :travel

    event :start_travel do
      transition :normal => :travel
    end

    event :finish_travel do
      transition :travel => :normal
    end
  end

end
