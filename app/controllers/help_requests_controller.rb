class HelpRequestsController < ApplicationController
  def index
    @help_requests = HelpRequest.all
  end

  def show
    @help_request = HelpRequest.find(params[:id])
  end

  def new
    @help_request = HelpRequest.new
  end

  def create
    @help_request = HelpRequest.new(help_request_params)
    @help_request.user = current_user
    if @help_request.save
      redirect_to help_request_path(@help_request)
    else
      render :new
    end
  end

  def edit
    @help_request = HelpRequest.find(params[:id])
  end

  def update
    @help_request = HelpRequest.find(params[:id])
    @help_request.update(help_request_params)
    redirect_to help_request_path(@help_request)
  end

  def destroy
    @help_request = HelpRequest.find(params[:id])
    @help_request.destroy
    redirect_to help_request_path
  end

  private

  def help_request_params
    params.require(:help_request).permit(:category, :title, :description, :location, :duration, :user_id)
  end
end
