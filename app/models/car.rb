class Car < ActiveRecord::Base

  def to_param
    binding.pry
    "#{car_slug}"
  end
end
