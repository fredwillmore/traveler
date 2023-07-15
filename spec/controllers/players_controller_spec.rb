require 'rails_helper'

describe PlayersController do
  let(:user) { create :user, id: 101 }
  let(:arrival_time) { "normal" }
  let(:state) { "normal" }

  let!(:player) do
    create(
      :player,
      id: 100,
      state: state,
      arrival_time: arrival_time,
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

      context "when player is in travel mode" do
        let(:state) { "travel" }

        context "when arrival time is in the past" do
          let(:arrival_time) { Time.now - 1.day }
  
          it "changes mode state travel to normal" do
            expect do
              get :show, params: { id: id }, format: :json
              player.reload
            end.to change(player, :travel?).from(true).to(false)
          end
        end

        context "when arrival time is in the future" do
          let(:arrival_time) { Time.now + 1.day }
  
          it "doesn't change state from travel" do
            expect do
              get :show, params: { id: id }, format: :json
              player.reload
            end.not_to change(player, :travel?)
          end
        end
      end
    end
  end

  describe "get index" do
    it "responds with success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "get start_travel" do
    let(:params) do
      {
        mode: "walking",
        destination_external_id: "aaaaaaaaaZZZZZZZZZ111111111",
        # travel_time: {
        #   distance: "16.9 km",
        #   duration: "3 hours 38 mins"
        # },
        # controller: "players",
        # action: "start_travel",
        id: "100",
        format: "json",
      }
    end

    it "calls set_trip" do
      expect_any_instance_of(Player).to receive(:set_trip).with(
        "aaaaaaaaaZZZZZZZZZ111111111", 'walking'
      )
      get :start_travel, params: params
    end
  end
end
