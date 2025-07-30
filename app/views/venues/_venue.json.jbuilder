json.extract! venue, :id, :name, :address, :capacity, :user_id, :created_at, :updated_at
json.url venue_url(venue, format: :json)
