require 'rails_helper'

RSpec.describe SpeedCalculation, type: :model do
  let(:speed) { SpeedCalculation.new(280,'nurburgring') }
  let(:track) { FactoryBot.create(:track,
                                  country: "Germany",
                                  name: 'nurburgring',
                                  timezone: "CET",
                                  surface_type: "snow"
                                 ) }

  describe "Surface factor" do

    before(:each) do
      track
    end

    it "shouldn't be nil" do
      expect(speed.max_speed).not_to be_nil
    end

    it "should get max_speed less that 280" do
      expect(speed.max_speed.to_i).to be < 280
    end

    it "display max_speed_on_track as 182" do
      expect(speed.max_speed.to_i).to eq 182
    end

    it "should display max speed on track as float number" do
      expect(speed.max_speed).to eq "182.0km/h"
    end

    it "should have km/h in result" do
      expect(speed.max_speed).to match(/km\/h/)
    end

  end
end
