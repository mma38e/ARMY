json.array!(@events) do |event|
  json.extract! event, :id, :eventName, :eventLocation, :eventDate, :eventTime, :eventInfo
  json.url event_url(event, format: :json)
end
