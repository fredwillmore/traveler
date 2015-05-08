require 'rails_helper'

describe Item do
  it { should belong_to :item_type }
end
