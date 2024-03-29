json.extract! sentence, :id, :book_id, :english_translation, :content, :language_id, :created_at, :updated_at
json.url sentence_url(sentence, format: :json)
