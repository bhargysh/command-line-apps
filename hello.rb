require 'optparse'
require 'byebug'

options = {}

OptionParser.new do |parser|
    parser.banner = "Usage: hello.rb [options]"
    parser.on("-h", "--help", "Show this help message.") do ||
        puts parser
    end
    parser.on("-c", "--count", Integer, "Repeat the message COUNT times") do |v|
        options[:count_times] = v
        byebug
    end
    parser.on("-n", "--name NAME", "The name of person to greet.") do |v|
        options[:name] = v
    end

end.parse!

if options[:name]
    options.fetch(:count_times, 1).times do
    puts "Hello #{ options[:name] }"
    end
end
