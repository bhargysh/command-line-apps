class Temperature
  def initialize
    @lat = Coordinates.lat
    @long = Coordinates.long
  end

  def self.fetch_current_temp
    fetch_response
  end

  private
  def fetch_response(lat, long)
    curl "api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=weather_api_key"
  end
end
