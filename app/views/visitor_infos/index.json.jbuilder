json.array!(@visitor_infos) do |visitor_info|
  json.extract! visitor_info, :id, :name, :surname, :date_of_arrival, :reason_for_vist, :mode_of_transport, :gender, :travel, :partner, :citizenship, :country, :user_id, :Below_18, :age18_24, :age25_34, :age35_44, :age45_54, :age55_64, :age65
  json.url visitor_info_url(visitor_info, format: :json)
end
