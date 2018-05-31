Car.delete_all
cars = {"Subaru Impreza" => 280, "Ford Shelby" => 250, "Dodge Challenger" => 310}
cars.each do |car,speed|
  Car.create(
    name: car,
    car_slug: car.gsub(' ','_').downcase,
    max_speed: speed
  )
end
