require 'rails_helper'

module Admin
  describe ItemTypesController do
    let(:admin) { create(:user) }
    let!(:thing) { create(:item_type, id: 1) }
    let(:base_path) { "admin/item_types" }
    let(:object_key) { :item_type }

    it_behaves_like 'basic CRUD controller'
  end
end
