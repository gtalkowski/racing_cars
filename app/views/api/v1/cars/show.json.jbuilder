json.data do
  json.car do
    json.id @car.id
    json.car_slug @car.car_slug
    json.max_speed_on_track @car.max_speed
  end
end
