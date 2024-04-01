require "aws-sdk-dynamodb"

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
  def get_item(key)
  #   @table.query({
  # index_name: 'words',
  # key_condition_expression: 'word = :word',
  # expression_attribute_values: {
  #   ':word' => word
  # }
  #   })
  @table.get_item({
    key: {"uuid" => key}
  })
  rescue Aws::DynamoDB::Errors::ServiceError => e
    puts("Couldn't get word #{word} from table #{@table.name}:\n")
    puts("\t#{e.code}: #{e.message}")
    raise
  end
end

def run
  db = DynamoDBBasics.new("spanish_dictionary")
  words = db.get_item("dba76cff-7344-4cb9-a2dc-132760154cd4")
  puts words
  puts words.class
end

run
