json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :publish
  json.url post_url(post, format: :json)
end
