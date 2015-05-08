require 'rails_helper'

describe Challenge do
  it { should belong_to :curriculum_area }
  it { should have_and_belong_to_many :challenge_types }

end
