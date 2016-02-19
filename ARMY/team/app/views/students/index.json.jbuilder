json.array!(@students) do |student|
  json.extract! student, :id, :firstName, :lastName, :email, :studentId
  json.url student_url(student, format: :json)
end
