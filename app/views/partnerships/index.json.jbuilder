json.array!(@partnerships) do |partnership|
  json.extract! partnership, :id, :partnership, :nump, :citizen, :user_id, :rdate, :visitor_id
  json.url partnership_url(partnership, format: :json)
end
