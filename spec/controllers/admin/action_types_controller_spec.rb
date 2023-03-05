require 'rails_helper'

module Admin
  describe ActionTypesController do
    let(:admin) { create(:user) }
    let!(:thing) { create(:action_type, id: 1) }
    let(:base_path) { "admin/action_types" }
    let(:object_key) { :action_type }

    it_behaves_like 'basic CRUD controller'
  end
end
