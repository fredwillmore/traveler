require 'rails_helper'

module Admin
  describe ChallengeTypesController do
    let(:admin) { create(:user) }
    let!(:thing) { create(:challenge_type, id: 1) }
    let(:base_path) { "admin/challenge_types" }
    let(:object_key) { :challenge_type }

    it_behaves_like 'basic CRUD controller'
  end
end
