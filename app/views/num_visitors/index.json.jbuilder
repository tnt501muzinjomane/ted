json.array!(@num_visitors) do |num_visitor|
  json.extract! num_visitor, :id, :visitor_infor_id, :numv
  json.url num_visitor_url(num_visitor, format: :json)
end
