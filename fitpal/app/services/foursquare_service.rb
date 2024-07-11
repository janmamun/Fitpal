# app/services/foursquare_service.rb
class FoursquareService
  include HTTParty
  base_uri 'https://api.foursquare.com/v3/places'

  def initialize
    api_key = Rails.application.credentials.dig(:foursquare, :api_key)
    Rails.logger.debug "Foursquare API Key: #{api_key}"
    @headers = {
      "Authorization" => "Bearer #{api_key}"
    }
  end

  def search_gyms(location)
    options = {
      query: {
        query: 'gym',
        near: location,
        radius: 10000
      },
      headers: @headers
    }
    self.class.get('/search', options)
  end
end
