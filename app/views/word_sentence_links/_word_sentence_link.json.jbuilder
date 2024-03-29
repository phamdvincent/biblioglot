json.extract! word_sentence_link, :id, :sentence_id, :word_id, :language_id, :book_id, :created_at, :updated_at
json.url word_sentence_link_url(word_sentence_link, format: :json)
