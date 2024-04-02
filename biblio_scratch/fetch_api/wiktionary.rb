# require 'json'

# # lines = File.foreach('../../spanish.json').first(3)

# # word_hash = JSON.parse(lines)

# # p lines.class

# # file = File.open("../../sample.json")

# # data = JSON.load(file)

# # file.close

# # p data

# # p data.class

# # Read the newline delimited JSON file
# ndjson_file_path = '../../spanish_nd.json'
# output_json_path = '../../spanish.json'

# output_array = []

# File.open(ndjson_file_path, 'r') do |file|
#   file.each_line do |line|
#     # Parse each line as JSON
#     json_data = JSON.parse(line)
#     # Add parsed JSON data to the output array
#     output_array << json_data
#   end
# end
# puts "finished ndjson"
# # Write the combined JSON array to a new file
# File.open(output_json_path, 'w') do |file|
#   file.write(JSON.generate(output_array))
# end
# puts "finished output generate"
