require 'rails_helper'

describe PlayerQuantity do
  it { should belong_to :player }
  it { should belong_to :quantity }
end
