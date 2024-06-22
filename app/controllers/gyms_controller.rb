class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def search
    if params[:location].present?
      coordinates = Geocoder.coordinates(params[:location])
      Rails.logger.debug "Coordinates for #{params[:location]}: #{coordinates}"

      if coordinates.present?
        @gyms = Gym.near(coordinates, 10) # Searching gyms within 10 miles of the coordinates
        if @gyms.empty?
          flash[:alert] = "No gyms found near the specified location."
        end
      else
        flash[:alert] = "Unable to geocode the specified location."
        @gyms = Gym.all
      end
    else
      @gyms = Gym.all
      flash[:alert] = "Please enter a location to search."
    end
    render :index
  end
end
