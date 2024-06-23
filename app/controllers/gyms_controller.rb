class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def search
    if params[:location].present?
      results = Geocoder.search(params[:location])
      Rails.logger.debug "Geocoder results: #{results.inspect}"
      if results.present?
        @location = results.first
        if @location.data["features"].present?
          coordinates = @location.data["features"].first["center"]
          latitude, longitude = coordinates[1], coordinates[0]
          @gyms = Gym.near([latitude, longitude], 10)
        else
          flash.now[:alert] = "Unable to geocode the specified location."
          @gyms = Gym.none
        end
      else
        flash.now[:alert] = "Unable to geocode the specified location."
        @gyms = Gym.none
      end
    else
      @gyms = Gym.none
    end

    render :index
  end
end
