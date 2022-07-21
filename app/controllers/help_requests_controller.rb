class HelpRequestsController < ApplicationController
  def index
    @help_requests = HelpRequest.all
    @markers = @help_requests.geocoded.map do |help_request|
      {
        lat: help_request.latitude,
        lng: help_request.longitude,
        info_window: render_to_string(partial: "info_window", locals: { help_request: help_request }),
        image_url: helpers.asset_url("Pin-peopletohelp.png")
      }
    end
  end

  def show
    @help_request = HelpRequest.find(params[:id])
    @markers = [{
      lat: @help_request.user.latitude,
      lng: @help_request.user.longitude,
      info_window: @help_request.user.address,
      image_url: helpers.asset_url("Pin-service.png")
    }]
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
