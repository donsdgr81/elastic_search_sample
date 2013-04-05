json.array!(@users) do |user|
  json.extract! user, :email, :name, :phone_number, :address
  json.url user_url(user, format: :json)
end