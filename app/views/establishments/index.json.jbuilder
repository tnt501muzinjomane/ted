json.array!(@establishments) do |establishment|
  json.extract! establishment, :id, :name
  json.url establishment_url(establishment, format: :json)
end
