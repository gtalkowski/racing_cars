require 'rails_helper'

RSpec.describe "api/v1/cars/show", type: :view do
  before { @car = FactoryBot.create :car }

  it "renders" do
    render
    expect(response).not_to be_empty
  end

  it "show data car_slug attribute" do
    render
    expect(JSON.parse(response)["car_slug"]).to eq(@car.car_slug)
  end
end
