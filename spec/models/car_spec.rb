require 'rails_helper'

RSpec.describe Car, type: :model do
  before { @car = FactoryBot.create :car }

  subject { @car }

  it { should respond_to :name }
  it { should respond_to :car_slug }
  it { should respond_to :max_speed }
end
