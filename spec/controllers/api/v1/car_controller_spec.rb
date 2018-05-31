require 'rails_helper'

RSpec.describe Api::V1::CarController, type: :controller do

  describe "GET #show" do

    before(:each) do
      @car = FactoryBot.create :car
    end

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns with car slug" do
      get :show, id: @car.id
      expect(JSON.parse(response.body)["car_slug"]).to eq @car.car_slug
    end
  end

end
