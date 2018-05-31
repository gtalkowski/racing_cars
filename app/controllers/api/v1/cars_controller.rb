class Api::V1::CarsController < ApplicationController

  before_action :car

  def show
    render json: @car
  end

  private

    def car
      @car = Car.find_by(:car_slug => params[:id])
    end
end
