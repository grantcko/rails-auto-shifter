class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :day

  CATEGORY = ["Day off", "Paid dayoff", "Time off"]
  enum category: CATEGORY
  validates :category, presence: true
  validate :preference_count_within_limit, on: :create

  def preference_count_within_limit

    if self.category == "Day off"
      day_off_limit = self.user.preferences.where(category: "Day off")
      errors.add(:category, "Exceeded day-off limit") if day_off_limit.count >= 6
    end
  end
end
