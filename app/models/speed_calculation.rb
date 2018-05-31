class SpeedCalculation

  SURFACE_TYPE = {:show => 35, :gravel => 12, :asphalt => 0}

  def initialize(car_speed, track)
    @car_speed = car_speed
    @track = track
  end

  def max_speed
    "#{@car_speed.to_i - slowing_factor_surface.to_i}"
  end

  def slowing_factor_surface
    30
  end

  def track
    Track.find_by(name: @track.downcase)
  end
end
