class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]

  def index
    @cars = Car.all.includes(:buyer)
  end

  def edit
    render :edit
  end

  def update
    if @car.update(car_params)
      redirect_to root_path, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_car
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit(:id, :plate, :model, :buyer_id, :delivery_status)
  end
end
