class Day < ApplicationRecord
  has_many :shifts
  has_many :assignments, through: :shifts
  has_many :preferences

  validates :date, presence: true
end
