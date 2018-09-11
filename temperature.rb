require 'optparse'
require 'byebug'
user_command = {}

OptionParser.new do |parser|
  parser.banner = "Usage of temperature.rb [options]"
  parser.on("-h", "--help", "Show this help message.") do ||
    puts parser
  end
  parser.on("-a", "--address ADDRESS", "Address of where current temperature value is wanted.") do |v|
    user_command[:address] = v
    byebug
  end
end.parse!

puts "Do you want the current temp for #{user_command[:address]}?"
# base_url = "https://weather.com/weather/today/l/"

# append these values to base_url like: /lat, long
# use curl to make http request to weather.com
# extract current temp value from response
# return value to user in a nice format, maybe emojis
