class CarsController < ApplicationController
  before_action :set_car_and_buyer, only: [:edit, :update]

  def index
    @cars = Car.all.includes(:buyer)
  end

  def edit
  end

  def new
    @car = Car.new
    @buyer = @car.buyer = Person.new
  end

  def create
    car_only_params = car_params
    buyer_params = car_only_params.delete :buyer_attributes

    @car = Car.new(car_only_params)
    @buyer = @car.build_buyer(buyer_params)

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

  def set_car_and_buyer
    @car = Car.find params[:id]
    @buyer = @car.buyer
  end

  def car_params
    params.require(:car).permit(:id, :plate, :model, :buyer_id, :delivery_status, :purchase_date, :expected_end_date, :buyer_type,
      buyer_attributes: [:id, :name, :cpf, :cnpj])
  end
end
