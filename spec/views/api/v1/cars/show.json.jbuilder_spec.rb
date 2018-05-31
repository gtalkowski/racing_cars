require 'rails_helper'

RSpec.describe "api/v1/cars/show", type: :view do
  before { @car = FactoryBot.create :car }

  it "renders" do
    render
  end
end
