class Api::V1::CarsController < ApiController

  before_action :set_car, :set_track

  def show
  end

  private

    def set_car
      @car ||= Car.find_by(:car_slug => params[:id])
    end

    def set_track
      @track ||= Track.find_by(name: params[:track].downcase) if params[:track]
    end
end
