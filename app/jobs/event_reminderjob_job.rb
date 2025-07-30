class EventReminderjobJob < ApplicationJob
  queue_as :default

  def perform(booking_id)
    @booking = Booking.find_by(id: booking_id)
    return unless @booking

    # puts "=================================================================="
    # puts "REMINDER: Sending email to #{@booking.user.email} for event '#{@booking.event.name}'."
    # puts "==================================================================" 
    UserMailer.event_reminder(@booking).deliver_now

  end
end
