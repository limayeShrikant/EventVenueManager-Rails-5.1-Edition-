json.extract! event, :id, :name, :description, :start_time, :end_time, :venue_id, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
