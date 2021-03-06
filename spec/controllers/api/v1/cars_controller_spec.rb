require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do

  render_views

  let(:json) { JSON.parse(response.body)["data"]["car"] }

  describe "GET #show" do

    before(:each) do
      @car = FactoryBot.create :car
      FactoryBot.create(:track,
                        country: "Germany",
                        name: 'nurburgring',
                        timezone: "CET",
                        surface_type: "snow"
                       )
    end

    it "returns http success" do
      get :show, id: @car.car_slug
      expect(response).to have_http_status(:success)
    end

    it "returns with car slug" do
      get :show, :id => @car.car_slug
      expect(json["car_slug"]).to eq @car.car_slug
    end

    it "should show 'no track selected' if no track params specified" do
      params = {id: @car.car_slug, track: nil }
      get :show, params
      expect(json["max_speed_on_track"]).to eq "no track selected"
    end

    it "should have track name" do
      params = { id: @car.car_slug, :track => "nurburgring" }
      get :show, params
      expect(json["max_speed_on_track"].to_i).to be < @car.max_speed.to_i
    end
  end

end
