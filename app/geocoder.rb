require 'geokit'

class Geocoder
  def self.bing_api_key
    Geokit::Geocoders::BingGeocoder.key = ''
  end
  def self.coordinates(address)
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    coordinates.ll
  end
end
