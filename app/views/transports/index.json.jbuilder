json.array!(@transports) do |transport|
  json.extract! transport, :id, :trans, :nump, :citizen, :user_id, :rdate, :visitor_id
  json.url transport_url(transport, format: :json)
end
