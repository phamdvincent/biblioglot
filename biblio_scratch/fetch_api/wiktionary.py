# import json

# # Path to your newline delimited JSON file
# ndjson_file_path = '../../spanish_nd.json'
# output_json_path = '../../spanish.json'

# output_data = []

# # Read the newline delimited JSON file
# with open(ndjson_file_path, 'r') as file:
#     for line in file:
#         # Parse each line as JSON
#         json_data = json.loads(line)
#         # Append parsed JSON data to the output list
#         output_data.append(json_data)

# # Write the combined JSON array to a new file
# with open(output_json_path, 'w') as file:
#     json.dump(output_data, file)

# print("Conversion completed. Output JSON file saved at:", output_json_path)
