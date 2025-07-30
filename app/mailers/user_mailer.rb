class UserMailer < ApplicationMailer

  default from: 'no-reply@eventvenuemanager.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.event_reminder.subject
  #
  def event_reminder(booking)
    @booking = booking
    @user = @booking.user
    @event = @booking.event
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Reminder: your event '#{@event.name}' is tomorrow!"
  end
end
