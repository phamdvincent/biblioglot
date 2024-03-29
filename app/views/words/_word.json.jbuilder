json.extract! word, :id, :word, :part_of_speech, :definition, :audio, :language_id, :created_at, :updated_at
json.url word_url(word, format: :json)
