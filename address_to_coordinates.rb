require 'geokit'

class AddressToCoordinates
  def self.address_to_coordinates(address)
    api_key
    byebug
    address.to_s
    coordinates = Geokit::Geocoders::BingGeocoder.geocode(address, :bias => 'aus')
    coordinates.ll
  end

  private
  def self.api_key
    Geokit::Geocoders::BingGeocoder.key = 'AgUttEhFOtU8gt_GQAc37Pui_3y3YEWEMyrXeHNL3OVPfAvgeaz-JE8ekQou_-yf'
  end
end
#returns "lat, long"
