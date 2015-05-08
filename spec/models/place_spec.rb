require 'rails_helper'

describe Place do
  it { should belong_to :location }
  it { should have_and_belong_to_many :place_types }
end
