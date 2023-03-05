require 'rails_helper'

module Admin
  describe CurriculumAreasController do
    let(:admin) { create(:user) }
    let!(:thing) { create(:curriculum_area, id: 1) }
    let(:base_path) { "admin/curriculum_areas" }
    let(:object_key) { :curriculum_area }

    it_behaves_like 'basic CRUD controller'
  end
end
