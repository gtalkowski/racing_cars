class Api::V1::CarController < ApplicationController

  before_action :car

  def show
  end

  private

    def car
      @car ||= Car.find_by(:id => params[:id])
    end
end
