require 'rails_helper'

module Admin
  describe UsersController do
    let(:admin) { create(:user) }

    it_behaves_like 'basic CRUD controller' do
      let(:object_params) do
        {
          email: "test@example.com",
          password: "something",
          first_name: "Freddy",
          last_name: "Test"
        }
      end
    end
  end
end
