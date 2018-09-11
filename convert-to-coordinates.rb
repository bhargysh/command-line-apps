require 'geokit'
require 'byebug'

def location_to_coordinates(address)
    address.to_s
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    coordinates.ll
end
#returns "lat, long"
