class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :sheet
    validates :date, presence: true
    validates :email , presence: true , length: {maximum: 255}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :name , presence: true , length: {maximum: 50}
    validates :schedule_id, presence: true, uniqueness: { scope: [:sheet_id, :date] }
    validates :sheet_id, presence: true
end

