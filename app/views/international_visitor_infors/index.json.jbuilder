json.array!(@international_visitor_infors) do |international_visitor_infor|
  json.extract! international_visitor_infor, :id, :africa, :asia, :america, :europe, :visitor_info_id
  json.url international_visitor_infor_url(international_visitor_infor, format: :json)
end
