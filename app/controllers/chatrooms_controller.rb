class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatrooms_params)
    @chatroom.save
    # @participant = Participant.new
    # @participant.chatroom = @chatroom
    # @participant.users << current_user
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private

  def chatrooms_params
    params.require(:chatroom).permit(:name)
  end
end
