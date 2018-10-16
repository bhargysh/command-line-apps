require 'net/http'
require 'uri'
require 'byebug'

class Temperature
  def initialize
    @lat = Coordinates.lat
    @long = Coordinates.long
  end

  def fetch_current_temp(lat, long)
    fetch_response(lat, long)
  end

  private
  def fetch_response(lat, long)
    #curl "http://api.openweathermap.org/data/2.5/weather?lat=25&lon=55&APPID=weather_api_key"
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=weather_api_key")
    response = Net::HTTP.get(uri)
    extract_temp(response)
  end

  def extract_temp(response)
    temp = response['main']['temp']
  end
end
