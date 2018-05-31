class Api::V1::CarController < ApplicationController

  before_action :car

  def show
  end

  private

    def car
      @car ||= Car.find_by(:name => params[:id])
    end
end
