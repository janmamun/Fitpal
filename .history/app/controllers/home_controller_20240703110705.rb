class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.latitude.present? && current_user.longitude.present?
      user_location = [current_user.latitude, current_user.longitude]
      @gyms = Gym.near(user_location, 10) # Find gyms within 10 miles (or kilometers) of the user's location
    else
      @gyms = Gym.all
    end
  end
end
