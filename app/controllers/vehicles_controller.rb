class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end


  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit_vehicle
    @vehicle=Vehicle.find(params[:id])
  end

  # POST /vehicles or /vehicles.json
  def create_vehicle
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to vehicles_path
    else
      render :index
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update_vehicle
    @vehicle=Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path
    else
      render :index
    end
    
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def delete_vehicle
    @vehicle=Vehicle.find(params[:id])
    if @vehicle.destroy
      redirect_to vehicles_path
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:number, :model)
    end
end
