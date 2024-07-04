Geocoder.configure(
  lookup: :mapbox,
  api_key: ENV['MAPBOX_API_KEY'], # Ensure this environment variable is set correctly
  units: :km, # Change to :mi if you prefer miles
)
