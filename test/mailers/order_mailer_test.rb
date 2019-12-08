require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "order_summary" do
    mail = OrderMailer.order_summary
    assert_equal "Order summary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_cancellation" do
    mail = OrderMailer.order_cancellation
    assert_equal "Order cancellation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
