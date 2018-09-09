require 'OptionParser'
require 'byebug'
input = {}

OptionParser.new do |parser|
    parser.banner = "Usage of temperature.rb [options]"
    parser.on("-h", "--help", "Show this help message.") do ||
        puts parser
    end
    parser.on("-l", "--location", "Location of where current temperature value is wanted.") do |v|
        input[:location] = v
byebug
    end
end.parse!

puts "Do you want the current temp for #{input[:location]}?"
#base_url = "https://weather.com/weather/today/l/"

#need a function that takes a location and returns lat and long coordinates
#append these values to base_url like: /lat, long
#use curl to make http request to weather.com
#extract current temp value from response
#return value to user in a nice format, maybe emojis
