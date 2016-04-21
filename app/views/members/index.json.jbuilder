json.array!(@members) do |member|
  json.extract! member, :id, :club_id, :user_id, :approved
  json.url member_url(member, format: :json)
end
