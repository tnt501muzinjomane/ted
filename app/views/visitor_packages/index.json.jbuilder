json.array!(@visitor_packages) do |visitor_package|
  json.extract! visitor_package, :id, :visitor_infor_id, :package_id
  json.url visitor_package_url(visitor_package, format: :json)
end
