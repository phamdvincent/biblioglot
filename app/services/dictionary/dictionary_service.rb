require "aws-sdk-dynamodb"
require "json"

module Dictionary_Service
  class DynamoDBBasics
    attr_reader :dynamo_resource
    attr_reader :table
  
    def initialize(table_name)
      client = Aws::DynamoDB::Client.new(region: "us-east-2")
      @dynamo_resource = Aws::DynamoDB::Resource.new(client: client)
      @table = @dynamo_resource.table(table_name)
    end
  
    # Gets movie data from the table for a specific movie.
    #
    # @param title [String] The title of the movie.
    # @param year [Integer] The release year of the movie.
    # @return [Hash] The data about the requested movie.
    def get_item(word)
      @table.query({
    index_name: 'word-index',
    key_condition_expression: 'word = :word',
    expression_attribute_values: {
      ':word' => word
    }
      })
    # @table.get_item({
    #   key: {"uuid" => key}
    # })
    rescue Aws::DynamoDB::Errors::ServiceError => e
      puts("Couldn't get word #{word} from table #{@table.name}:\n")
      puts("\t#{e.code}: #{e.message}")
      raise
    end
  
  
  end


  def self.get_word_json_list(language, word)
    if language == 'es'
      dictionary = "spanish_dictionary"
    end
    db = DynamoDBBasics.new(dictionary)
    parsed_json_list = []
    json_list = db.get_item(word).items
    json_list.each do |item|
      json_object = JSON.parse(item["json"])
      parsed_json_list.append(json_object)
    end
    return parsed_json_list

  end
end
