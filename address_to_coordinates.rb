require './geocoder'

class AddressToCoordinates
  def self.address_to_coordinates(address)
    byebug
    error_message = 'Invalid input, please enter a valid string'
    raise TypeError, error_message unless address.is_a? String
    Geocoder.bing_api_key
    Geocoder.coordinates
  end
end
#returns "lat, long"
