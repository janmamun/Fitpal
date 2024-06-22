class Gym < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def to_json(options = {})
    {
      id: id,
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude
    }.to_json(options)
  end
end
