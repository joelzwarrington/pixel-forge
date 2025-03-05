require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should create message" do
    assert_difference("Message.count") do
      post messages_url, params: { message: { body: @message.body, character_id: @message.character_id, location_id: @message.location_id } }
    end

    assert_redirected_to message_url(Message.last)
  end
end
