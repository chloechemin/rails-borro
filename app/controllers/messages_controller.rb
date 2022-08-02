class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @participants = Participant.where(chatroom_id: @chatroom.id)
    if @participants[0].user_id == current_user.id
      @user = User.find(@participants[1].user_id)
    else
      @user = User.find(@participants[0].user_id)
    end
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
      MessageNotification.with(booking: @message, message: "#{current_user.username} has sent you a message").deliver(@user)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
