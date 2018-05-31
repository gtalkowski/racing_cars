class SpeedCalculation

  def initialize(car_speed, track)
    @car_speed = car_speed
    @track = track
  end

  def max_speed
    "#{@car_speed.to_i}"
  end
end
