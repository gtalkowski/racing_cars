require 'rails_helper'

RSpec.describe "api/v1/cars/show", type: :view do
  before { @car = FactoryBot.create :car }

  it "renders" do
    render
    expect(response).not_to be_empty
  end

  it "show data car_slug attribute" do
    render
    expect(JSON.parse(response)["data"]["car"]["car_slug"]).to eq(@car.car_slug)
  end

  it "should show max_speed_on_track data" do
    render
    expect(JSON.parse(response)["max_speed_on_track"]).not_to be_nil
  end
end
