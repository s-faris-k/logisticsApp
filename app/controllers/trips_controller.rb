class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /trips or /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  # def create
  #   trip_details = params[:tripDetails]
  #   trip_details.each_with_index do |trip_detail, index|
  #     puts "Trip #{index + 1}:"
  #     trip_detail.each do |key, value|
  #       puts "#{key}: #{value}"
  #     end
  #   end
  #   trip_details.each do |trip_detail|
  #     Trip.create(trip_detail)
  #   end

  #   render json: { message: 'Trips created successfully' }
  # end
  def create
    trip_details = trip_params[:tripDetails]

    # Iterate through each trip detail and create a new Trip record
    trip_details.each do |trip_detail|
      Trip.create(trip_detail)
    end

    # Respond with a success message
    render json: { message: 'Trips created successfully' }
  end
  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.permit(tripDetails: [:start_date, :driver, :client, :vehicle, :starting, :ending, :running, :end_date])
    end
end
