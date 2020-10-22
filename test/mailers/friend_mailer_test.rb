require 'test_helper'

class FriendMailerTest < ActionMailer::TestCase
  test "send_when_requested" do
    mail = FriendMailer.send_when_requested
    assert_equal "Send when requested", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
