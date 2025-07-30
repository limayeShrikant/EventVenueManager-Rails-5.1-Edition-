class BookingService
    # Passing all the required objects for the service to do its work
    def initialize(event, user)
        @event = event
        @user = user
        @venue = @event.venue
    end

    # A single Public method .call to execute the action.
    def call
        # Business Rule 1: A user cannot book their own Event. Only an Admin can.
        return[:error, :cannot_book_own_event] if @event.user == @user

        # Business Rule 2: The Booking must not conflict with other bookings at the same venue.
        return[:error, :date_conflict] if conflicting_booking_exists?

        @booking = Booking.new(event: @event, user: @user, status: 'confirmed')

        if @booking.save
            #  Success! Return the :success symbol and the newly created object.
            [:success, @booking]
        else
            #  Failed for other reason (Validations)
            [:error, @booking,errors.full_messages]
        end
    end

    def conflicting_booking_exists?
        # Find any other booking at this venue that overlaps with our event's time.
        # This is a complex query that is perfect to hide away in a service.
        @venue.events.joins(:bookings)
        .where.not(id: @event.id) # Exclude current event id
        .where("events.start_time < ? And events.end_time > ?", @event.end_time, @event.start_time)
        .exists?
    end
end