class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatrooms_params)
    @chatroom.save
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
