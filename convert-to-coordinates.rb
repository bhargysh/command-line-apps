require 'geokit'
require 'byebug'

Geokit::Geocoders::BingGeocoder.key = 'AgUttEhFOtU8gt_GQAc37Pui_3y3YEWEMyrXeHNL3OVPfAvgeaz-JE8ekQou_-yf'

def location_to_coordinates(address)    
    address.to_s
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    coordinates.ll
end
#returns "lat, long"
