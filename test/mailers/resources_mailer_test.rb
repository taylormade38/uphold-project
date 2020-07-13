require 'test_helper'

class ResourcesMailerTest < ActionMailer::TestCase
  test "resources" do
    mail = ResourcesMailer.resources
    assert_equal "Resources", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
