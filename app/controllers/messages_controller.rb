class MessagesController < ApplicationController
  respond_to :turbo_stream, only: %i[ create ]

  def create
    @message = Message.new(message_params)
    @message.save

    respond_with(@message)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
