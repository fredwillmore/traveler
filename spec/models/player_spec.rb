require 'rails_helper'

describe Player do
  it { should have_many :player_quantities }
  it { should have_many(:quantities).through :player_quantities }
  it { should belong_to :location }
  it { should belong_to(:destination).class_name Location }
end
