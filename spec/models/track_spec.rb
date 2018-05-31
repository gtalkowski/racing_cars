require 'rails_helper'

RSpec.describe Track, type: :model do
  before { @car = FactoryBot.create :track }
  subject { @car }

  it { should respond_to :country }
end
