class HomeController < ApplicationController
  def index
    @gyms = Gym.all
    @featured_gyms = Gym.limit(5)  # Example logic to fetch featured gyms
    @recent_chats = current_user.sent_chats.or(current_user.received_chats).order(created_at: :desc).limit(5) if user_signed_in?  # Example logic to fetch recent chats
    @user_profile = current_user if user_signed_in?  # Example logic to fetch user profile
  end
end
