class DaysController < ApplicationController
  def index
    @days = policy_scope(Day)
    # go through each day and collect it in an array if the day's date's is == the specific month
    if params[:month]
      @days = @days.filter { |day| day.date.month == params[:month].to_i }
      @this_month = month_of_days(params[:month].to_i)
    else
      @days = @days.filter { |day| day.date.month == Date.today.month }
      @this_month = month_of_days(3)
    end

    if @days.count.positive?
      @days_before = days_between_count(@days, :before)
      @days_after = days_between_count(@days, :after)
    else
      @days_before = 0
      @days_after = 0
    end

    @shifts = Shift.all

    if params[:user_id]
      @shifts = @shifts.joins(:assignments).where(assignments: { user_id: params[:user_id] })
    end

    @current_user = current_user
    if params[:query].present?
      @users = User.search_by_name(params[:query])
    else
      @users = User.all
    end
    @weeks = ["SUN", "MON", "TUE", "WED", "THUR", "FRI", "SAT"]
    @paid_dayoff = get_days_off("Paid dayoff")
    @dayoff = get_days_off("Day off")
    @time_off = get_days_off("Time off")
  end

  def get_days_off(category)
    days = current_user.preferences.where(category: category)
    days.select do |preference|
      if params["month"]
        preference.day.date.month == params["month"].to_i
      else
        preference.day.date.month == 3
      end
    end
  end

  def show
    @day = Day.find(params[:id])
    @shifts = Shift.where(day_id: params[:id])
    @day_shift_errors = {}
    authorize @day
    authorize @shifts
    # User.all.each { |user| user.shift_errors = [] }
    days = Day.where("extract(month from date) = ?", @day.date.month)
    User.all.each do |user| # each user
      @shifts.each do |shift| # each shift on that day
        user.can_be_assigned?(shift, days) # loading up error messages per shift
        # loading up the error given for each shift
        @day_shift_errors[[user.id, user.shift_errors[0]]] = user.shift_errors[1]
      end
    end

    @sorted_users = User.all.sort_by do |user|
      if user.shift_errors[1] == "available"
        [0, user.name.downcase] # Sort available users first, then alphabetically by name
      elsif user.shift_errors[1] == "time off requested"
        [1, user.name.downcase] # Sort users with day off requested next, then alphabetically by name
      elsif user.shift_errors[1] == "day off requested"
        [2, user.name.downcase]
      elsif user.shift_errors[1] == "max work days reached"
        [3, user.name.downcase]
      else
        [4, user.name.downcase] # Sort remaining users alphabetically by name
      end
    end

    render :show
  end

  def create
    @day = Day.new(day_params)
    authorize @day
    if @day.save
      redirect_to days_path
    else
      render "days/index", status: :unprocessable_entity
    end
  end

  def create_month
    month = params[:month].present? ? params[:month] : Date.today.month
    days = Day.where("extract(month from date) = ?", month)
    shifts = Shift.where(day_id: days)
    Assignment.destroy_by(shift: shifts)
    shifts.each do |shift|
      User.all.shuffle.each do |user|
        next unless user.can_be_assigned?(shift, days)

        @assignment = Assignment.new(shift:, user:)
        authorize @assignment
        @assignment.save
        break if shift.assignments.count == 3
      end
    end
    redirect_to days_path(month: month)
  end

  private

  def day_params
    params.require(:day).permit(:date, :approved)
  end

  def month_of_days(day)
    months = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"]
    if day > 0
      return months[day - 1]
    else
      return months[Date.today.month - 1]
    end
  end
end

def days_between_count(days, key)
  first_day = Date::DAYNAMES[days.first.date.wday].to_sym
  last_day = Date::DAYNAMES[days.last.date.wday].to_sym
  days_num = {
    Sunday: 0,
    Monday: 1,
    Tuesday: 2,
    Wednesday: 3,
    Thursday: 4,
    Friday: 5,
    Saturday: 6
  }

  # raise
  if key == :before
    # raise
    return days_num[first_day]
  elsif key == :after
    return 6 - days_num[last_day]
  end
end
