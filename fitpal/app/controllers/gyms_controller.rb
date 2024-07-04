# app/controllers/gyms_controller.rb
class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Gym not found."
    redirect_to gyms_path
  end

  def search
    if params[:location].present?
      foursquare_service = FoursquareService.new
      response = foursquare_service.search_gyms(params[:location])

      if response.success?
        Rails.logger.debug "Foursquare response data: #{response.parsed_response}"
        @gyms = response.parsed_response["results"].map do |result|
          Gym.new(
            name: result["name"],
            address: result["location"]["formatted_address"].presence || "Address not available",
            latitude: result.dig("geocodes", "main", "latitude"),
            longitude: result.dig("geocodes", "main", "longitude")
          )
        end
      else
        flash.now[:alert] = "Unable to fetch gyms from Foursquare."
        @gyms = Gym.none
      end
    else
      @gyms = Gym.none
    end

    render :index
  end
end
