class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :preferences
  has_many :assignments
  has_many :shifts, through: :assignments
  has_many :days, through: :shifts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :preferences
  has_one_attached :photo
  validates :name, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def can_be_assigned?(shift, total_days)
    self.shift_errors = []
    #### if has a preference day it needs to be respected
    preferences.where(day: shift.day).each do |preference|
      if preference.category == "day_off"
        update_error_messages(:day_preference, self, shift)
        return false
      elsif preference.category == "paid_dayoff"
        update_error_messages(:paid_day_preference, self, shift)
        return false
      end

      #### if someone has a shift preference it needs to be respected
      if preference.unavailable_shift_ids.include?(shift.id)
        update_error_messages(:shift_preference, self, shift)
        return false
      end
    end

    #### if someone is scheduled one night they can't be scheuduled next morning
    # if shift.start_time.hour == 6 && assignments.find_by(end_time: )
    #   update_error_messages(:late_early, self, shift)
      # return false
    if shifts.where(day: Day.find_by(date: shift.day.date - 1)).where('end_time >= ?', shift.start_time - 10.hours).exists?
    # if assignments.where(shift: Shift.where(day_id: shift.day.id - 1).last).count.positive? # if there are any shifts scheduled yest for this user
    #   yest_end = Assignment.find_by(shift: Shift.where(day_id: shift.day.id - 1).last, user: self).shift.end_time # collect yesterday's shifts end time
    #   today_start = shift.start_time # collect today's shift's start time
    #   if today_start - yest_end == 10 * 60 * 60
      update_error_messages(:late_early, self, shift)
      return false # not valid if there is 10 hours between start and end times
    end
    # end

    #### can't work more than 6 days in a row
    # work_days = []
    # work_day_numbers = []
    # assignments.each do |assignment|
    #   work_days << assignment.shift.day unless work_days.include?(assignment.shift.day) # collect work days
    # end

    # work_days = assignments.where(shift_id: shifts).where.not(shift: shift)
    work_days = days.where("extract(month from date) = ?", shift.day.date.month)

    #### needs 9 days min off in a month
    # raise
    if work_days.count == total_days.count - 9 # && self.assignments.last.shift.id < shift.id
      update_error_messages(:nine_off, self, shift)
      return false
    elsif work_days.count > total_days.count - 9
      update_error_messages(:less_nine_off, self, shift)
      return false
    end
    #### not work more than once on the same day
    if work_days.include?(shift.day)
      update_error_messages(:same_day, self, shift)
      return false
    end

    #### can't be scheduled on a shift that already has 3 or more people
    if shift.assignments.count >= 3
      update_error_messages(:available, self, shift)
      return false
    end

    #### otherwise they are valid
    update_error_messages(:available, self, shift)
    return true
  end

  def update_error_messages(key, user, shift)
    all_error_messages = {
      day_preference: "day off requested",
      paid_day_preference: "paid day off requested",
      filled: "filled. otherwise, available",
      shift_preference: "time off requested",
      seventh_day: "seventh_day",
      same_day: "scheduled today",
      nine_off: "max work days reached",
      less_nine_off: "max work days supassed",
      available: "available",
      late_early: "scheduled on last shift yesterday"
    }

    #  all_error_messages.delete(key)
    (user.shift_errors << shift.id) && (user.shift_errors << all_error_messages[key])
    user.save
    # raise
  end
end
