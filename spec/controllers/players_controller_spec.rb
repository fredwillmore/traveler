require 'rails_helper'

describe PlayersController do
  let(:user) { create :user, id: 101 }
  let!(:player) do
    create(
      :player,
      id: 100,
      is_current_player: is_current_player,
      location: create(:location, id: 102),
      level: 3,
      name: "Test Player",
      dob: Date.new(1999, 8, 9),
      user: user,
      gender: 'male',
      occupation: 'thing doer',
      attractiveness: 80,
      charisma: 81,
      status: 82,
      intelligence: 83,
      luck: 84,
      base_locale: "en",
      target_locale: "es",
      target_dialect: "es",
    )
  end
  let(:is_current_player) { true }

  before do
    sign_in user
  end
  
  describe "get :show" do
    context "when player exists" do
      let(:id) { 100 }

      it "responds with success" do
        get :show, params: { id: id }, format: :json
        expect(response).to have_http_status(:success)
      end

      render_views true

      it "responds with json" do
        get :show, params: { id: id }, format: :json
        expect(JSON.parse(response.body)).to eq(
          {
            'id' => 100,
            'user_id' => 101,
            'state' => 'normal',
            'location_id' => 102,
            'destination_id' => nil,
            'level' => 3,
            'name' => "Test Player",
            'gender' => "male",
            'dob' => "1999-08-09",
            'occupation' => "thing doer",
            'attractiveness' => 80,
            'charisma' => 81,
            'status' => 82,
            'intelligence' => 83,
            'luck' => 84,
            'base_locale' => "en",
            'target_locale' => "es",
            'target_dialect' => "es",
            'is_current_player' => true,
            # these are all still just baby yoda
            'avatar_urls' => {
              "xsmall" => "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=20",
              "small" => "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=50",
              "medium" => "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=150",
              "large" => "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=300",
              "xlarge" => "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=400",
              "xxlarge" => "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=500"
            }
          }
        )
      end
    end
  end

  describe "get index" do
    it "responds with success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
