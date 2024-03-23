class TripsController < ApplicationController
  before_action :set_trip, only: %i[ edit_trip update_trip delete_trip ]
  skip_before_action :verify_authenticity_token

  # GET /trips or /trips.json
  def index
    @trips = Trip.all
  end
  # GET /trips/new
  def new_trip
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit_trip
    @trips
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
  def create_trip
    trip_details = trip_params[:tripDetails]

    # Iterate through each trip detail and create a new Trip record
    trip_details.each do |trip_detail|
      Trip.create(trip_detail)
    end

    # Respond with a success message
    render json: { message: 'Trips created successfully' }
  end
  # PATCH/PUT /trips/1 or /trips/1.json
  def update_trip
      if @trip.update(update_params)
        redirect_to trips_path
      else
        render :update_trip
      end
  end
      

  # DELETE /trips/1 or /trips/1.json
  def delete_trip
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
    def update_params
      #params.permit(: [:start_date, :driver, :client, :vehicle, :starting, :ending, :running, :end_date])
      params.require(:trip).permit(:start_date, :driver, :client, :vehicle, :starting, :ending, :running, :end_date)
    end

end
