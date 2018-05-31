class SpeedCalculation

  SURFACE_TYPE = {:snow => 35, :gravel => 12, :asphalt => 0}
  DRIVING_TIME = {540...1079 => 0, 1080...1289 => 8, 1290...1439 => 15, 0...359 => 15, 360...539 => 8}

  def initialize(car_speed, track)
    @car_speed = car_speed
    @track = track
  end

  def max_speed
    "#{@car_speed.to_f - slowing_factor_surface.to_f - slowing_factor_current_driving_time.to_f}km/h"
  end

  def slowing_factor_surface
    surface_percentage = SURFACE_TYPE[track.surface_type.to_sym].to_f
    @car_speed.to_f - (@car_speed.to_f * ((100 - surface_percentage.to_f) / 100))
  end

  def slowing_factor_current_driving_time
    ""
  end

  def time_of_the_day
    time = Time.new
    cur_time_in_timezone = time.in_time_zone(track.timezone)
    cur_time_in_timezone.strftime("%H:%m")
  end

  def hours_to_minutes(time)
    hour = time.split(":")[0].to_i
    minutes = time.split(":")[1].to_i
    hour * 60 + minutes
  end

  def minutes_to_hours(minutes)
    hours = minutes.to_i / 60
    minutes = minutes % 60
    "#{hours}:#{"%02d" % minutes}"
  end

  def track
    Track.find_by(name: @track.downcase)
  end
end
