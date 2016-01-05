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
    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path, notice: "Carro criado com sucesso" }
        format.json { render json: @car }
      else
        format.html { render :new }
        format.json { render json: { errors: @car.errors }, status: :bad_request }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to cars_path, notice: "Carro editado com sucesso" }
        format.json { render json: @car }
      else
        format.html { render :edit }
        format.json { render json: { errors: @car.errors }, status: :bad_request }
      end
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
