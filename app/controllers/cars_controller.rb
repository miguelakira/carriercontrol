class CarsController < ApplicationController

  def index
    @cars = Car.all.includes(:buyer)
  end

  private

  def set_car
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit(:id, :plate, :model, :buyer_id)
  end
end
