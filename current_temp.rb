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
    uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=weather_api_key")
    response = Net::HTTP.get(uri)
    # require 'pry'; binding.pry
    extract_temp(response)
  end

  def extract_temp(response)
    temp = response['main']['temp']
  end

  # def response_code(response)
  #   response.code
  # end
end
