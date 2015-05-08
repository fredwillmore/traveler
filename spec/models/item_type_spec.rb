require 'rails_helper'

describe ItemType do
  it { should have_many :items }
end
