require "json"
require "uri"
require "net/http"

module Nlp
  class NlpService
    def self.get_nlp(language, content)
      uri = URI.parse("http://#{ENV["EC2_ADDRESS"]}:80/cgi-bin/nlp.cgi")
      http = Net::HTTP.new(uri.host, uri.port)
  
      # Create a JSON object to send
      data = { language: language, content: content }
      json_data = data.to_json
  
      # Prepare the request
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = json_data
      request.content_type = "application/json"
  
      # Send the request
      response = http.request(request)
      processed_story = JSON.parse(response.body)["processed_story"]
      return processed_story
    end
    
  end
end
