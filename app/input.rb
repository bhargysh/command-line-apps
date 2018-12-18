require 'optparse'
require_relative './address_to_coordinates'
require_relative './current_temp'

def parse_address(addr)
  if /\d+\s\w+\s\w+,\s+\w+,\s\w+$/.match?(addr)
    coordinates = Coordinates.address_to_coordinates(addr)
    lat = Coordinates.lat(coordinates)
    long = Coordinates.long(coordinates)

    puts "#{Temperature.fetch_current_temp(lat, long)} degree celcius"
  else
    example = "511 Church St, Richmond, VIC"
    puts "This input: ***#{addr}*** is not valid. A valid input looks like #{example}."
  end
end

def get_option_parser_object
  user_command = {}
  x = OptionParser.new.tap do |parser|
    parser.banner = "Usage of temperature app [options]"

    parser.on("-h", "--help", "Show this help message.") do ||
      puts parser
    end
    parser.on("-a", "--address ADDRESS", "Address of where current temperature value is wanted.") do |v|
      user_command[:address] = v
      parse_address(v)
    end
  end
  return x
end

get_option_parser_object.parse!
