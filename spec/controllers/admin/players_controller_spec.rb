require 'rails_helper'

module Admin
  describe PlayersController do
    let(:admin) { create(:user) }
    let(:user) { create(:user) }

    it_behaves_like 'basic CRUD controller' do
      let(:object_params) do
        {
          name: 'Thing',
          user_id: user.id
        }
      end
    end
  end
end
