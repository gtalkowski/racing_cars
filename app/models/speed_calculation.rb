class SpeedCalculation

  SURFACE_TYPE = {:snow => 35, :gravel => 12, :asphalt => 0}

  def initialize(car_speed, track)
    @car_speed = car_speed
    @track = track
  end

  def max_speed
    "#{@car_speed.to_f - slowing_factor_surface.to_f - slowing_factor_time_of_the_day.to_f}km/h"
  end

  def slowing_factor_surface
    surface_percentage = SURFACE_TYPE[track.surface_type.to_sym].to_f
    @car_speed.to_f - (@car_speed.to_f * ((100 - surface_percentage.to_f) / 100))
  end

  def slowing_factor_time_of_the_day
    30
  end

  def track
    Track.find_by(name: @track.downcase)
  end
end
