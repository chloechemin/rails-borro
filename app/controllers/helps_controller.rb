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
      redirect_to root_path
    else
      render :new
    end
  end

  def help_params
    params.require(:help).permit(:message, :user_id, :help_request_id, :help_id)
  end
end
