require 'rails_helper'

RSpec.describe SpeedCalculation, type: :model do
  let(:speed) { SpeedCalculation.new(280,'nurburgring') }

  describe "Surface factor" do

    it "shouldn't be nil" do
      expect(speed.max_speed).not_to be_nil
    end

    it "should get max_speed less that 280" do
      expect(speed.max_speed.to_i).to be < 280
    end
  end
end
