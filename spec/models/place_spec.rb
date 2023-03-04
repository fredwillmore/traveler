require 'rails_helper'

describe Place do
  it { should belong_to :location }
  it { should have_and_belong_to_many :place_types }

  describe "class methods" do
    subject { described_class }

    describe "find_or_create_by_external_id" do
      # let(:external_id) { "abcdefghijklmnop-0123456789" }
      let(:external_id) { "ChIJV5D16suglVQR-kJRdSOrUwo" }

      it "works right" do
        expect { subject.find_or_create_by_external_id(external_id) }.not_to raise_error
      end
    end
  end
end
