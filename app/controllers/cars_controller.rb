class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]

  def index
    @cars = Car.all.includes(:buyer)
  end

  def edit
    render :edit
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car
    else
      render json: { errors: @car.errors }, status: :bad_request
    end
  end

  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: { errors: @car.errors }, status: :bad_request
    end
  end

  def show
    @car = Car.find params[:id]
  end

  private

  def set_car
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit(:id, :plate, :model, :buyer_id, :delivery_status)
  end
end
