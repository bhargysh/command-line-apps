require_relative './geocoder'

class Coordinates
  def self.address_to_coordinates(address)
    error_message = 'Invalid input, please enter a valid string'
    raise TypeError, error_message unless address.is_a? String
    Geocoder.bing_api_key
    Geocoder.coordinates(address)
  end

  def self.lat(coordinates)
    coordinates_list = coordinates.split(",")
    coordinates_list[0].to_f
  end

  def self.long(coordinates)
    coordinates_list = coordinates.split(",")
    coordinates_list[1].strip.to_f
  end
end
