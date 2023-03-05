require 'rails_helper'

module Admin
  describe RewardTypesController do
    let(:admin) { create(:user) }

    it_behaves_like 'basic CRUD controller'
  end
end
