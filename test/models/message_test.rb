require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Bob", password_digest: "password")
    @message = Message.new(body: "hello world", user: @user)
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "body should be valid" do
    assert @message.body = "      "
    assert_not @message.valid?
  end
end
