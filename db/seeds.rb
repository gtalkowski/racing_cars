Car.delete_all
cars = {"Subaru Impreza" => 280, "Ford Shelby" => 250, "Dodge Challenger" => 310}
cars.each do |car,speed|
  Car.create(
    name: car,
    car_slug: car.gsub(' ','_').downcase,
    max_speed: speed
  )
end

Track.delete_all
Track.create(country: "Germany", name: "nurburgring", timezone: "CET", surface_type: "asphalt")
Track.create(country: "Australia", name: "sydney_motorsport_park", timezone: "Australia/Sydney", surface_type: "gravel")
Track.create(country: "Canada", name: "circuit_gilles_villenaeuve_montreal", timezone: "America/Montreal", surface_type: "snow")
Track.create(country: "Macau", name: "guia_circut", timezone: "Asia/Macau", surface_type: "asphalt")
