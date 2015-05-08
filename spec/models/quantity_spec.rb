require 'rails_helper'

describe Quantity do
  it { should have_many :player_quantities }
  it { should have_many(:players).through :player_quantities }
end
