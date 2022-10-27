class Sheet < ApplicationRecord
    has_many :reservations, dependent: :destroy,foreign_key: :sheet_id
    validates :column,presence: true
    validates :row,presence: true
end
