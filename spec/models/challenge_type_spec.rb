require 'rails_helper'

describe ChallengeType do
  it { should have_and_belong_to_many :challenges }

end
