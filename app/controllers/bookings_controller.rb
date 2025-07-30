class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index
        @bookings = Booking.includes(:user).where(user: current_user).all
    end

    def create
        @event = Event.find(params[:event_id])

        @service = BookingService.new(@event, current_user)
        status,result = @service.call


        case status
        when :success
            @booking = result
            redirect_to event_path(@event), notice: "Event booked successfully!"
        when :error
            redirect_to event, alert: "Booking failed: #{result.to_s.humanize}"
        end
    end

end