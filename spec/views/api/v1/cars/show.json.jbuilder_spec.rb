require 'rails_helper'

RSpec.describe "api/v1/cars/show", type: :view do
  before { @car = FactoryBot.create :car }

  let(:json) { JSON.parse(response.body) }

  it "renders" do
    render
    expect(response).not_to be_empty
  end

  it "show data car_slug attribute" do
    render
    expect(json["data"]["car"]["car_slug"]).to eq(@car.car_slug)
  end

  it "should show max_speed_on_track data" do
    render
    expect(json["data"]["car"]["max_speed_on_track"]).not_to be_nil
  end

  it "should show max_speed" do
    render
    expect(json["data"]["car"]["max_speed"]).not_to be_nil
  end

  it "should show max_speed with km/h" do
    render
    expect(json["data"]["car"]["max_speed"]).to eq "#{@car.max_speed}km/h"
  end

end
