json.data do
  json.car do
    json.id @car.id
    json.car_slug @car.car_slug
    json.max_speed "#{@car.max_speed}km/h"
    json.max_speed_on_track params[:track] ? SpeedCalculation.new(@car.max_speed, params[:track]).max_speed : "no track selected"
  end
end
