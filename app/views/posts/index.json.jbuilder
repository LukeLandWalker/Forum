json.array!(@posts) do |post|
  json.extract! post, :name, :user_id, :types, :content
  json.url post_url(post, format: :json)
end