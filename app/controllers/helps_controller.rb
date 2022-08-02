class HelpsController < ApplicationController
  def new
    @help_request = HelpRequest.find(params[:help_request_id])
    @help = Help.new
  end

  def create
    @help = Help.new(help_params)
    @help_request = HelpRequest.find(params[:help_request_id])
    @help.help_request = @help_request
    @help.user = current_user
    if @help.save
      @chatroom = Chatroom.new({ name: "#{@help.user.username}" })
      @chatroom.save
      @message = Message.new({ content: @help.message })
      @message.chatroom = @chatroom
      @message.user = current_user
      @message.save
      @participant_user = Participant.new({ chatroom_id: @chatroom.id, user_id: help_request.user.id })
      @participant_user.save
      @participant_helper_user = Participant.new({ chatroom_id: @chatroom.id, user_id: @help.user.id })
      @participant_helper_user.save
      redirect_to help_requests_path(@help_requests, @help)
      MessageNotification.with(booking: @message, message: "#{current_user.username} wants to help you!").deliver(@help_request.user)
    else
      render :new
    end
  end

  def help_params
    params.require(:help).permit(:message, :user_id, :help_request_id, :help_id)
  end
end
