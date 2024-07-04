class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Ensure Devise helpers are available in views
  helper_method :user_signed_in?, :current_user
end
