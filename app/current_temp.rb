require 'net/http'
require 'uri'

class Temperature
  def self.fetch_current_temp(lat, long)
    fetch_response(lat, long)
  end

  private
  def self.fetch_response(lat, long)
    uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=4344aa8adf06a5646109007806023afe")
    response = Net::HTTP.get(uri)
    extract_temp(response)
  end

  def self.extract_temp(response)
    temp = response['main']['temp']
    convert_to_celsius(temp)
  end

  def self.convert_to_celsius(temp)
    celsius_temperature = ((temp - 32) * 5/9).round
  end
end
#should the temperature class be instantiated with lat long?
