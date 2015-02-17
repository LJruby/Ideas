json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :votes, :status_id, :category_id, :user_id
  json.url idea_url(idea, format: :json)
end
