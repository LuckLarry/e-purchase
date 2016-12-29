json.extract! user, :id, :username, :mobile, :password, :created_at, :updated_at
json.url user_url(user, format: :json)