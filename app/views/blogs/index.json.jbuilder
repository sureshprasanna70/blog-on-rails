json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :content, :published
  json.url blog_url(blog, format: :json)
end
