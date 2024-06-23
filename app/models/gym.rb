class Gym < ApplicationRecord
  belongs_to :user

  has_many :workouts
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
