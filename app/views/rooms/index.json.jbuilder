json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :guest_id
  json.url room_url(room, format: :json)
end
