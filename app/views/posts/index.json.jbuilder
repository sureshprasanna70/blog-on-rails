json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :publish,:created_at
  json.url post_url(post)
end