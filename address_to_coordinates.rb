require './geocoder'

class Coordinates
  def self.address_to_coordinates(address)
    error_message = 'Invalid input, please enter a valid string'
    raise TypeError, error_message unless address.is_a? String
    Geocoder.bing_api_key
    Geocoder.coordinates
  end

  def self.extract_lat(coordinates)
    coordinates.split(",")
    coordinates[0].to_i
  end

  def self.extract_long(coordinates)
    coordinates.split(",")
    coordinates[1].strip.to_i
  end
end
