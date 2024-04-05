require "json"
require "uri"
require "net/http"

module Nlp
  class NlpService

    # def self.get_nlp(language, content)
    #   PyCall.sys.path.append("./app/services/nlp")
    #   # PyCall.sys.path.append('.')
    #   PyCall.import_module("stanza_nlp")
    #   python_module = PyCall.import_module("stanza_nlp")
    #   response = python_module.get_json_data(language, content)
    #   return response
    # end
    def self.get_nlp(language, content)
      uri = URI.parse("http://ec2-3-22-224-208.us-east-2.compute.amazonaws.com:80/cgi-bin/nlp.cgi")
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
      puts "kfjldsfjdfjdjfdslkfjdkfklfjlkfjeoiruewireoiruoi3498374398743984739856397398sihdsfhdshhhh" + response.body
      processed_story = JSON.parse(response.body)["processed_story"]
      return processed_story
    end
    
  end
end

# module NlpService
#   def self.get_nlp(language, content)
#     PyCall.sys.path.append('./app/services/nlp')
#     # PyCall.sys.path.append('.')
#     PyCall.import_module('stanza_nlp')
#     python_module = PyCall.import_module('stanza_nlp')
#     response = python_module.get_json_data(language, content)
#     return response
#   end
# end

# # NLP_Processor.new.get_nlp_json("El hombre es gordo. La mujer es bonita.",'es')

# # NLP_Processor.new.get_nlp_json("SERÍAN las diez de la mañana de un día de octubre. En el patio de la Escuela de Arquitectura, grupos de estudiantes esperaban a que se abriera la clase.")
