class LocationsController < ApplicationController

  def index
    @cities = City.where(state: params[:id])
    render json: @cities
  end
end