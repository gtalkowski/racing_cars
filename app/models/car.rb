class Car < ActiveRecord::Base

  def to_param
    "#{car_slug}"
  end
end
