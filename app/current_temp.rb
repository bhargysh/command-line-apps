require 'net/http'
require 'uri'
require 'json'

class Temperature
  class << self
    def fetch_current_temp(lat, long)
      fetch_response(lat, long)
    end

    private
    def fetch_response(lat, long)
      uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=")
      response = Net::HTTP.get(uri)
      extract_temp(response)
    end

    def extract_temp(response)
      json_obj = JSON.parse(response)
      temp = json_obj['main']['temp']
      convert_to_celsius(temp)
    end

    def convert_to_celsius(temp)
      celsius_temperature = (temp - 273.15).round
    end
  end
end
#should the temperature class be instantiated with lat long?
