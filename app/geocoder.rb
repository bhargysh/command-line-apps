require 'geokit'

class Geocoder
  def self.bing_api_key
    Geokit::Geocoders::BingGeocoder.key = 'AgUttEhFOtU8gt_GQAc37Pui_3y3YEWEMyrXeHNL3OVPfAvgeaz-JE8ekQou_-yf'
  end
  def self.coordinates(address)
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    coordinates.ll
  end
end
