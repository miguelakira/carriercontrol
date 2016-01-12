class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]

  def index
    @cars = Car.all.includes(:client)
  end

  def edit
    @states = State.all
    @location = @car.build_location
  end

  def new
    @car = Car.new
    @client = @car.client = Person.new
    @freight = @car.build_freight
    @states = State.all
    @location = @car.build_location

  end

  def create
    raise params.inspect
    @car = Car.new(car_params)
    @client = @car.build_client(client_params)

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
    raise params.inspect
    respond_to do |format|
      if @car.update(car_and_client_params)
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
    @freight = @car.freight
    @client = @car.client
  end

  def car_params
    params.require(:car).permit(:id, :plate, :model, :client_id, :delivery_status, :purchase_date, :expected_end_date, :client_type,
      freight_attributes: [:id, :subtotal, :ferry, :platform, :platform_origin, :platform_destination, :redispatching, :observation, :discount])
  end

  def client_params
    client_params = params.require(:car).permit(client_attributes: [:id, :name, :cpf, :cnpj, :legal_name, :phone, :email])
    client_params[:client_attributes]
  end

  def payment_params
    payment_params
  end

  def car_and_client_params
    car_params.merge(client_attributes: client_params)
  end
end
