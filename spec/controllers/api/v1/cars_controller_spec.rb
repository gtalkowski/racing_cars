require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do

  describe "GET #show" do

    before(:each) do
      @car = FactoryBot.create :car
    end

    it "returns http success" do
      get :show, id: @car.car_slug
      expect(response).to have_http_status(:success)
    end

    it "returns with car slug" do
      get :show, id: @car.car_slug
      expect(JSON.parse(response.body)["car_slug"]).to eq @car.car_slug
    end
  end

end
