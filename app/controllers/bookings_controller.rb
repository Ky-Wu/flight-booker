class BookingsController < ApplicationController
  def new
    num_passengers = params[:num_tickets].to_i
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build()
    num_passengers.times { @booking.passengers.build }
  end

  def create
    flight = Flight.find(params[:booking][:flight_id])
    @booking = flight.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    #Exclude flight id since it's not necessary for building through associations
    def booking_params
      params.require(:booking).permit(:flight_id, :date, 
      passengers_attributes: [:id, :name, :email]).except(:flight_id)
    end
end
