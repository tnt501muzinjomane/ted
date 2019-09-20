json.array!(@countries) do |country|
  json.extract! country, :id, :visitor_id, :name
  json.url country_url(country, format: :json)
end
