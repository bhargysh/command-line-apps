require 'optparse'
user_command = {}

OptionParser.new do |parser|
  parser.banner = "Usage of temperature app [options]"

  parser.on("-h", "--help", "Show this help message.") do ||
    puts parser
  end
  parser.on("-a", "--address ADDRESS", "Address of where current temperature value is wanted.") do |v|
    user_command[:address] = v
  end
end.parse!

#puts "Do you want the current temp for #{user_command[:address]}?"
# return value to user in a nice format, maybe emojis
