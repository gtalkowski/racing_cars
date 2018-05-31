class Api::V1::CarsController < ApiController

  before_action :set_car

  def show
  end

  private

    def set_car
      @car = Car.find_by(:car_slug => params[:id])
    end
end
