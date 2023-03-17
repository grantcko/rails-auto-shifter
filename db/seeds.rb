puts "\n"
25.times {print '-'}
puts "\n\nCLEARING THE DATABASE...\n\n"

######### DESTROYING #########

Preference.destroy_all
puts "destroyed preferences"
Assignment.destroy_all
puts "destroyed assignments"
Shift.destroy_all
puts "destroyed shifts"
Day.destroy_all
puts "destroyed days"
User.destroy_all
puts "destroyed users"
puts "\n"
25.times { print '-' }

######### CREATING #########

puts "\n\nCREATING INSTANCES...\n\n"

#### USER
taka = User.create!(
  manager: true,
  name: "Taka Nakagami",
  email: "taka@gmail.com",
  password: '123123'
)
# p photo_url = "https://res.cloudinary.com/dn2mnawil/image/upload/v1678073467/Shift%20better%20user%20profile%20pics/117798839_eiqm5g.jpg"
#   file = URI.open(photo_url)
  # taka.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')


taka = User.create!(
  manager: true,
  name: "Zuma Dotwav",
  email: "zuma@gmail.com",
  password: '123123'
)
# p photo_url = "https://res.cloudinary.com/dw0jec2ls/image/upload/v1678341314/Screen_Shot_2023-03-09_at_14.55.01_fmt0uo.png"
  # file = URI.open(photo_url)
  # taka.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

user = User.create!(
  name: "Grant Hall",
  email: "grant@gmail.com",
  password: '123123'
)
# p photo_url = "https://res.cloudinary.com/dn2mnawil/image/upload/v1678248003/Shift%20better%20user%20profile%20pics/P_20230308_124932_nms5br.jpg"
  # file = URI.open(photo_url)
  # user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

user = User.create!(
  name: "Anik Dutta",
  email: "anik@gmail.com",
  password: '123123'
)
# p photo_url = "https://res.cloudinary.com/dn2mnawil/image/upload/v1678073512/Shift%20better%20user%20profile%20pics/80834097_qjxoyt.jpg"
  # file = URI.open(photo_url)
  # user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

user = User.create!(
    name: "Tan Rungthip",
    email: "tan@gmail.com",
    password: '123123'
  )
  # p photo_url = "https://res.cloudinary.com/dn2mnawil/image/upload/v1678073499/Shift%20better%20user%20profile%20pics/121886405_wm7rea.jpg"
  #   file = URI.open(photo_url)
  #   user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

  #   photo_urls = [
  #     "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241862/Shift%20better%20user%20profile%20pics/avatar-11854f7f8348cacfb710a94e90e5b681_scujlj.png",
  #     "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241861/Shift%20better%20user%20profile%20pics/avatar-1120f0f14a04c0e1ce2f0218dcae17a3_jex088.png",
  #     "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241861/Shift%20better%20user%20profile%20pics/avatar-11396edc29ac5c1ff0c657811d2ee08d_whespz.png",
  #     "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241861/Shift%20better%20user%20profile%20pics/avatar-113f2c66c8dc1ca19f740392aa1700e1_bztbqq.png"
  #   ]

    4.times do
      first_name = Faker::Name.unique.male_first_name
      last_name = Faker::Name.last_name
      user = User.create!(
        name: "#{first_name} #{last_name}",
        email: "#{first_name.downcase}.#{last_name.downcase}@gmail.com",
        password: '123123'
      )

      # photo_url = photo_urls.sample
      # photo_urls.delete(photo_url) # remove the photo URL from the array
      # file = URI.open(photo_url)
      # user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
    end



    # photo_urls = [
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678242000/Shift%20better%20user%20profile%20pics/avatar-115967dc580561fc62c8929638ec6b36_flhhdt.png",
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241862/Shift%20better%20user%20profile%20pics/avatar-11855acb83324b8b3338c78041067387_y1akkw.png",
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241862/Shift%20better%20user%20profile%20pics/avatar-11b2786d64fbfdd11f91dff12ff78d69_wiszsa.png",
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241862/Shift%20better%20user%20profile%20pics/avatar-11c1e0e5495f1f0965b9444048764627_pe4thh.png",
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241862/Shift%20better%20user%20profile%20pics/avatar-11063300d86c155ef3677e1339e2d31c_oq0dky.png",
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241862/Shift%20better%20user%20profile%20pics/avatar-11ba1cbb607eb52e9dda6fd258ff0e82_uc4vop.png",
    #   "https://res.cloudinary.com/dn2mnawil/image/upload/v1678241845/Shift%20better%20user%20profile%20pics/avatar-11983a50d678ef2824c08dcbdb3c921c_wsdvtk.png"
    # ]

    7.times do
      first_name = Faker::Name.unique.female_first_name
      last_name = Faker::Name.last_name
      user = User.create!(
        name: "#{first_name} #{last_name}",
        email: "#{first_name.downcase}.#{last_name.downcase}@gmail.com",
        password: '123123'
      )

      # photo_url = photo_urls.sample
      # photo_urls.delete(photo_url) # remove the photo URL from the array
      # file = URI.open(photo_url)
      # user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
    end
puts "created #{User.count} users"

#### DAY
#### SHIFT
march_one_date = Date.new(2023, 1, 1)
march_one_time = DateTime.new(2023, 1, 1)

times = {
  one: march_one_time + 1.fdiv(24),
  two: march_one_time + 2.fdiv(24),
  three: march_one_time + 3.fdiv(24),
  four: march_one_time + 4.fdiv(24),
  five: march_one_time + 5.fdiv(24),
  six: march_one_time + 6.fdiv(24),
  seven: march_one_time + 7.fdiv(24),
  eight: march_one_time + 8.fdiv(24),
  nine: march_one_time + 9.fdiv(24),
  ten: march_one_time + 10.fdiv(24),
  eleven: march_one_time + 11.fdiv(24),
  twelve: march_one_time + 12.fdiv(24),
  fourteen: march_one_time + 14.fdiv(24),
  fifteen: march_one_time + 14.fdiv(24),
  sixteen: march_one_time + 14.fdiv(24),
  seventeen: march_one_time + 17.fdiv(24),
  eighteen: march_one_time + 17.fdiv(24),
  nineteen: march_one_time + 17.fdiv(24),
  twenty: march_one_time + 20.fdiv(24),
  twenty_one: march_one_time + 21.fdiv(24),
  twenty_two: march_one_time + 22.fdiv(24),
  twenty_three: march_one_time + 23.fdiv(24),
  twenty_four: march_one_time + 1
}

365.times do
  Day.create!(date: march_one_date)

  march_one_time += 1
  march_one_date += 1

  Shift.create!(start_time: times[:six], end_time: times[:fourteen], day_id: Day.last.id)
  Shift.create!(start_time: times[:nine], end_time: times[:seventeen], day_id: Day.last.id)
  Shift.create!(start_time: times[:twelve], end_time: times[:twenty], day_id: Day.last.id)
  Shift.create!(start_time: times[:fifteen], end_time: times[:twenty_three], day_id: Day.last.id)
  Shift.create!(start_time: times[:eighteen], end_time: times[:two] + 1, day_id: Day.last.id)
  Shift.create!(start_time: times[:twenty_one], end_time: times[:five] + 1, day_id: Day.last.id)
  Shift.create!(start_time: times[:twenty_four], end_time: times[:eight] + 1, day_id: Day.last.id)
end

puts "created #{Day.count} days starting on #{Day.first.date}"
puts "created #{Shift.count} shifts"

#### PREFERENCE
notes = [
  "I have a doctor's appointment across town",
  "I am meeting my brother from america",
  "I am selling my kidney to the Yakuza",
  "I am going to kill a turtle",
  "I need to take the train at this time"
]

User.all.each do |user|
  #### PREFERENCES FOR MARCH
  days = Day.all.filter { |day| day.date.month == 3 }

  3.times do
    Preference.create!(
      category: "Day off",
      user_id: user.id,
      day_id: days.sample.id
    )
  end

  rand(1..2).times do
    Preference.new(category: "Paid dayoff", user_id: user.id, day_id: days.sample.id)
  end

  rand(0..1).times do
    preference = Preference.new(
      category: "Time off",
      user_id: user.id,
      day_id: days.sample.id,
      unavailable_shift_ids: Shift.where(day: days.sample).sample.id
    )
    preference.unavailable_shift_ids = [] << Shift.where(day: preference.day).sample.id
    preference.note = notes.sample
    preference.save
  end

  #### PREFERENCES FOR APRIL
  days = Day.all.filter { |day| day.date.month == 4 }

  3.times do
    Preference.create!(
      category: "Day off",
      user_id: user.id,
      day_id: days.sample.id
    )
  end

  rand(1..2).times do
    Preference.new(
      category: "Paid dayoff",
      user_id: user.id,
      day_id: days.sample.id
    )
  end

  rand(0..2).times do
    preference = Preference.new(
      category: "Time off",
      user_id: user.id,
      day_id: days.sample.id,
      unavailable_shift_ids: Shift.where(day: days.sample).sample.id
    )
    preference.unavailable_shift_ids = [] << Shift.where(day: preference.day).sample.id
    preference.note = notes.sample
    preference.save
  end
end

users = User.all.to_a
14.times do
  days = Day.all.filter { |dayy| dayy.date.month == 4 }
  # shift = days.last.shifts.first
  shift = Day.find_by(date: Date.new(2023, 04, 29)).shifts.last
  Preference.create!(
    category: "Time off",
    unavailable_shift_ids: [shift.id],
    user: users.delete_at(0),
    day: shift.day
  )
end

puts "created #{Preference.count} preferences"

#### ASSIGNMENT
# Shift.all.each do |shift|
#   user = User.all.sample
#   3.times {
#     Assignment.create!(user:, shift:)
#     user = User.all.sample while user == Assignment.last.user
#   }
# end

puts "created #{Assignment.count} assignments"
