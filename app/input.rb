require 'optparse'
require_relative './address_to_coordinates'

def parse_address(addr)
  #require 'pry'; binding.pry
  /\d+\s\w+\s\w+,\s+\w+,\s\w+$/.match(addr) do |match_obj|
    #require "byebug"; byebug
    Coordinates.address_to_coordinates(match_obj[0])
  end
end

def getOptionsObject
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
  end#.parse!
  return x
end

getOptionsObject.parse!


# parse_address(addr)


#puts "The current temperature for #{user_command[:address]} is: Temperature.fetch_current_temp(parse_address(address))"

#User inputs their address using the --address field
#take the input and pass it to coordinates class to convert it to a coordinate
#output is the current temp or an error if invalid input
