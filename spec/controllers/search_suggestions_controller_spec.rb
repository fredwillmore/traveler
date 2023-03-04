require "rails_helper"

describe SearchSuggestionsController do
  describe "get :index" do
    it "responds with success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
