require 'rails_helper'

describe PlaceType do
  it { should have_and_belong_to_many :places }
  it { should have_many :place_type_data }
end
