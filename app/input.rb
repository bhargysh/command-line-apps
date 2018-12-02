require 'optparse'
require_relative './address_to_coordinates'
require_relative './current_temp'

def parse_address(addr)
  if /\d+\s\w+\s\w+,\s+\w+,\s\w+$/.match(addr) do |match_obj|
    valid_address = match_obj[0]
    coordinates = Coordinates.address_to_coordinates(valid_address)

    lat = Coordinates.lat(coordinates)
    long = Coordinates.long(coordinates)

    '''need to split lat and long so can feed that into temp'''
    Temperature.fetch_current_temp(lat, long)
    end
  else
    puts "This input: ***#{addr}*** is not valid. An example of an input could be #{example}."
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

#puts "The current temperature for #{user_command[:address]} is: Temperature.fetch_current_temp(parse_address(address))"

#User inputs their address using the --address field
#take the input and pass it to coordinates class to convert it to a coordinate
#output is the current temp or an error if invalid input
