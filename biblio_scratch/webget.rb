require 'net/http'

# Replace 'ec2-instance-ip' with the public IP or DNS of your EC2 instance
# url = URI.parse('http://ec2-3-15-8-181.us-east-2.compute.amazonaws.com:5000')

# response = Net::HTTP.get_response(url)

# puts response.body if response.is_a?(Net::HTTPSuccess)

require 'uri'
require 'net/http'
require 'json'

uri = URI.parse("http://ec2-18-117-155-56.us-east-2.compute.amazonaws.com:80/cgi-bin/nlp.cgi")
http = Net::HTTP.new(uri.host, uri.port)

# Create a JSON object to send
data = { content: "El hombre es gordo.", language: 'es' }
json_data = data.to_json

# Prepare the request
request = Net::HTTP::Post.new(uri.request_uri)
request.body = json_data
request.content_type = 'application/json'

# Send the request
response = http.request(request)

# Print the response
puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
