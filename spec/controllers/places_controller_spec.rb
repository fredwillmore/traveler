require 'rails_helper'

describe PlacesController do
  let(:user) { create :user }
  let!(:place) do
    create(
      :place,
      id: 100,
      external_id: 'ABCDEF1234567890abcdefghijk',
      name: 'Ye Olde Bodye Shoppe',
      rating: 4.5,
      location: create(:location, lat: 23, lng: 44)
    )
  end

  before do
    sign_in user
  end

  describe "get :show" do
    context "when place exists" do
      let(:external_id) { 'ABCDEF1234567890abcdefghijk' }

      it "responds with success" do
        get :show, params: { external_id: external_id , format: :json}
        expect(response).to have_http_status(:success)
      end

      render_views true

      it "responds with json" do
        get :show, params: { external_id: external_id }, format: :json
        expect(JSON.parse(response.body)).to eq(
          {
            "id" => 100,
            "external_id" => "ABCDEF1234567890abcdefghijk",
            "name" => "Ye Olde Bodye Shoppe",
            "rating" => 4.5,
            "food_value" => 12,
            "food_cost" => 10,
            "drink_value" => 24,
            "drink_cost" => 9,
            "lat" => 23,
            "lng" => 44,
          }
        )
      end
    end

    context "when place doesn't exist" do
      let(:external_id) { 'ABCDEF0000000000abcdefghijk' }

      it "raises an error" do
        expect do
          get :show, params: { external_id: external_id }
        end.to raise_error(GooglePlaces::InvalidRequestError)
      end
    end

  end
end
