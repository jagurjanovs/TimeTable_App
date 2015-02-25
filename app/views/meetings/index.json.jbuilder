json.array!(@meetings) do |meeting|
  json.extract! meeting, :title, :id, :group_involved, :meeting_name, :agenda, :meeting_created_by, :memberID1, :memberID2, :memberID3, :memberID4, :memberID5, :memberID6, :date, :start_time, :end_time
  json.start meeting.start_time
  json.end meeting.end_time
  json.url meeting_url(meeting, format: :html)
end