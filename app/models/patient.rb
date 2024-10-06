class Patient < ApplicationRecord
    scope :to_attend, -> { where(attended: false) }
    scope :attended, -> { where(attended: true) }
end
