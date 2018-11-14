require_relative './geocoder'

class Coordinates
  def self.address_to_coordinates(address)
    error_message = 'Invalid input, please enter a valid string'
    raise TypeError, error_message unless address.is_a? String
    Geocoder.bing_api_key
    Geocoder.coordinates(address)
  end

  def self.lat
    coordinates = address_to_coordinates.split(",")
    coordinates[0].to_i
  end

  def self.long
    coordinates = address_to_coordinates.split(",")
    coordinates[1].strip.to_i
  end
end
