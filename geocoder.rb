require 'geokit'
class Geocoder

  def self.coordinates(address)
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    byebug
    coordinates.ll
  end
end
