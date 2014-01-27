require 'json'
require 'httparty'

@last_response = HTTParty.get('http://localhost:3000/' + ARGV[0])

output = File.open('output.txt', 'w+')
output.puts JSON.pretty_generate JSON.parse(@last_response.body)
output.close