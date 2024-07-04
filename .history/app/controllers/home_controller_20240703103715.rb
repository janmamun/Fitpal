class HomeController < ApplicationController
  def index
    if user_signed_in?
      user_location = [current_user.latitude, current_user.longitude]
      Rails.logger.debug "User location: #{user_location.inspect}"
      @gyms = Gym.near(user_location, 10) # Find gyms within 10 miles (or kilometers) of the user's location
    else
      @gyms = Gym.all
    end
  end
end
