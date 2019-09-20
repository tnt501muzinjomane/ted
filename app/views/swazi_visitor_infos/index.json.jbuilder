json.array!(@swazi_visitor_infos) do |swazi_visitor_info|
  json.extract! swazi_visitor_info, :id, :place_of_residence, :visitor_info_id
  json.url swazi_visitor_info_url(swazi_visitor_info, format: :json)
end
