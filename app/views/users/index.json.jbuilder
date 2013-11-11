json.array!(@users) do |user|
  json.extract! user, :name, :email, :login, :password
  json.url user_url(user, format: :json)
end
