class Schedule < ApplicationRecord
    belongs_to :movie,foreign_key: :movie_id
    validates :start_time, presence: true
    validates :end_time , presence: true
end
