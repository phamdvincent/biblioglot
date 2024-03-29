json.extract! progress, :id, :user_id, :book_id, :location, :progress_percentage, :created_at, :updated_at
json.url progress_url(progress, format: :json)
