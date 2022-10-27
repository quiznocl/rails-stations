class Schedule < ApplicationRecord
    belongs_to :movie,foreign_key: :movie_id
    has_many :reservations, dependent: :destroy,foreign_key: :schedule_id
    validates :start_time, presence: true
    validates :end_time , presence: true
end
