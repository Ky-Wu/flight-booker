class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  def index
    @airports = Airport.all
    dates = Flight.future.distinct.pluck(:date)
    @date_options = dates.map { |date| [ formatted_date(date), date ] }
    unless flight_params.empty?
     @flights = Flight.where(flight_params).try(:on_day, params[:date]) 
     @num_tickets = params[:num_tickets].to_s
    end
  end

  # GET /flights/1
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to @flight, notice: 'Flight was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      redirect_to @flight, notice: 'Flight was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
    redirect_to flights_url, notice: 'Flight was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flight_params
      params.permit(:to_airport_id, :from_airport_id, 
                    :num_tickets, :date).except(:num_tickets, :date)
    end

    # Format a date.
    def formatted_date(date)
      date.strftime("%m/%d/%Y")
    end

end
