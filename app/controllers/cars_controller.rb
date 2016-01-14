class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]
  before_action :set_states, only: [:new, :edit]

  def index
    @cars = Car.all.includes(:client)
  end

  def edit
  end

  def new
    @car = Car.new
    @location = @car.build_location
    @client = @car.client = Person.new
    @freight = @car.build_freight
  end

  def create
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

  def find_by_plate
    car = Car.find_by plate: params[:plate]
    render json: car
  end

  private
  def set_car
    @car = Car.find params[:id]
    @freight = @car.freight
    @client = @car.client
    @location = @car.location
  end

  def set_states
    @states = State.all
  end

  def car_params
    car_params = params.require(:car).permit(:id, :plate, :model, :client_id, :delivery_status, :purchase_date, :expected_end_date, :client_type,
    freight_attributes: [:id, :subtotal, :ferry, :platform, :platform_origin, :platform_destination, :redispatching, :observation, :discount],
      location_attributes: [:id, :origin_id, :destination_id, :current_id]
      )

    car_params[:freight_attributes].each do |key, value|
      if [:ferry, :platform, :platform_origin, :platform_destination, :redispatching, :discount].include?(key.to_sym)
        value.gsub!("R$","").gsub!(".", "").gsub!(",", ".") unless value.empty?
      end
    end

    car_params
  end

  def client_params
    client_params = params.require(:car).permit(client_attributes: [:id, :name, :cpf, :cnpj, :legal_name, :phone, :email])
    client_params[:client_attributes]
  end


  def car_and_client_params
    car_params.merge(client_attributes: client_params)
  end
end
