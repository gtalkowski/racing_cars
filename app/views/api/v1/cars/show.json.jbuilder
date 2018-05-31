json.data do
  json.car do
    json.id @car.id
    json.car_slug @car.car_slug
    json.max_speed "#{@car.max_speed}km/h"
    json.max_speed_on_track params[:tack] ? @car.max_speed : "no track selected"
  end
end
