require 'rails_helper'

RSpec.describe SpeedCalculation, type: :model do
  let(:speed) { SpeedCalculation.new(280,Track.find_by(name: 'nurburgring')) }
  let(:track) { FactoryBot.create(:track,
                                  country: "Germany",
                                  name: 'nurburgring',
                                  timezone: "CET",
                                  surface_type: "snow"
                                 ) }
  let(:dtime) {
    {540...1079 => 0, 1080...1289 => 8, 1290...1439 => 15, 0...359 => 15, 360...539 => 8}
  }

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
      expect(speed.send(:slowing_factor_surface)).to eq 98
    end

  end

  describe "Time of the day factor" do
    before(:each) do
      track
    end

    it "calculates time on the day slowing factor" do
      expect(speed.send(:slowing_factor_current_driving_time)).not_to be_nil
    end

    it "calculates time of the day as CET timezone" do
      expect(speed.send(:time_of_the_day)).to eq Time.zone.now.strftime("%H:%m")
    end

    it "calculates slowing factor depends ot the day time" do
      factor = dtime.select {|d_time|
        d_time === speed.send( :hours_to_minutes, Time.zone.now.strftime("%H:%m") )
      }
      expect(speed.send(:slowing_factor_current_driving_time)).to eq factor.values[0]
    end

    it "convert time to minutes" do
      expect(speed.send(:hours_to_minutes, "20:00")).to eq 1200
    end

    it "convert minutes to real time" do
      expect(speed.send(:minutes_to_hours, 1200)).to eq "20:00"
    end

  end

  describe "Speed without track as params" do
    let(:speed) { SpeedCalculation.new(280,nil) }

    it "shouldn't be nil" do
      expect(speed.max_speed).not_to be_nil
    end
  end
end
