require 'rails_helper'

RSpec.describe Track, type: :model do
  before { @car = FactoryBot.create :track }
  subject { @car }

  it { should respond_to :country }
  it { should respond_to :name }
  it { should respond_to :timezone }
  it { should respond_to :surface_type }
end
