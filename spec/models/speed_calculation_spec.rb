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

    it "should have km/h in result" do
      expect(speed.max_speed).to match(/km\/h/)
    end

    it "calculates slowing factor for surface" do
      expect(speed.slowing_factor_surface).to eq 98
    end

    it "calculates time on the day slowing factor" do
      expect(speed.slowing_factor_current_driving_time).not_to be_nil
    end

    it "calculates time of the day as CET timezone" do
      time = Time.zone.now
      expect(speed.time_of_the_day).to eq time.strftime("%H:%m")
    end

  end
end
