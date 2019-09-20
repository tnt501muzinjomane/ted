json.array!(@reasons) do |reason|
  json.extract! reason, :id, :reason, :nump, :citizen, :user_id
  json.url reason_url(reason, format: :json)
end
