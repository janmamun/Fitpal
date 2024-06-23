# app/services/foursquare_service.rb
class FoursquareService
  include HTTParty
  base_uri 'https://api.foursquare.com/v3'

  def initialize
    @headers = {
      "Accept" => "application/json",
      "Authorization" => ENV['FOURSQUARE_API_KEY']
    }
  end

  def search_gyms(location)
    options = { headers: @headers, query: { query: 'gym', near: location, limit: 10 } }
    response = self.class.get('/places/search', options)
    Rails.logger.debug "Foursquare response: #{response.body}"
    response
  end
end
