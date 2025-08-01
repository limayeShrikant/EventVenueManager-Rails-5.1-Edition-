require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "event_reminder" do
    mail = UserMailer.event_reminder
    assert_equal "Event reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
