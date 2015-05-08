require 'rails_helper'

describe Location do
  it { should have_one :place }
  it { should have_many :players }
end
