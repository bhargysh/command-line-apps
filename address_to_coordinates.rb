require 'geokit'

class AddressToCoordinates
  def self.address_to_coordinates(address)
    api_key
    byebug
    address.to_s
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    coordinates.ll
  end
end
#returns "lat, long"
