class Meeting < ActiveRecord::Base

  validates :group_involved, presence: true, length: { minimum: 1, maximum: 10 }
  validates :meeting_created_by, presence: true, length: { minimum: 9, maximum: 9 }
  validates :meeting_name, presence: true, length: { minimum: 2, maximum: 40 }
  validates :agenda, presence: true, length: { minimum: 5, maximum: 60 }
  validates :memberID1, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID2, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID3, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID4, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID5, presence: true, length: { minimum: 9, maximum: 9 }
  validates :memberID6, presence: true, length: { minimum: 9, maximum: 9 }


end

