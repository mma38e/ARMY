json.array!(@memberships) do |membership|
  json.extract! membership, :id, :club_id, :user_id, :approved
  json.url membership_url(membership, format: :json)
end
