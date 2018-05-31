require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do

  render_views

  let(:json) { JSON.parse(response.body) }

  describe "GET #show" do

    before(:each) do
      @car = FactoryBot.create :car
    end

    it "returns http success" do
      get :show, id: @car.car_slug
      expect(response).to have_http_status(:success)
    end

    it "returns with car slug" do
      get :show, :id => @car.car_slug
      expect(json["data"]["car"]["car_slug"]).to eq @car.car_slug
    end

    it "should show 'no track selected' if no track params specified" do
      params = {id: @car.car_slug, track: "" }
      get :show, params
      expect(json["data"]["car"]["max_speed_on_track"]).to eq "no track selected"
    end
  end

end
