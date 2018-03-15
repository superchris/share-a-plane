json.extract! airport, :id, :code, :description, :latitude, :longitude, :created_at, :updated_at
json.url airport_url(airport, format: :json)
