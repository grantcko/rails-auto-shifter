class Shift < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
  belongs_to :day

  validates :start_time, presence: true
  validates :end_time, presence: true
end
