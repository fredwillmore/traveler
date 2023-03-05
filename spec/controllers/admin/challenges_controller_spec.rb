require 'rails_helper'

module Admin
  describe ChallengesController do
    let(:admin) { create(:user) }
    let!(:thing) { create(:challenge, id: 1) }
    let(:base_path) { "admin/challenges" }
    let(:object_key) { :challenge }

    it_behaves_like 'basic CRUD controller'
  end
end
