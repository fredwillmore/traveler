require 'rails_helper'

module Admin
  describe ItemTypesController do
    let(:admin) { create(:user) }

    it_behaves_like 'basic CRUD controller'
  end
end