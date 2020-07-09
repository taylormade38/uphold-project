# require 'faker'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Officer.destroy_all
City.destroy_all

5.times do
  User.create!(email: Faker::Internet.email, password: 'password')
end

puts "Creating cities..."
city1 = {name: 'New York City', state: 'New York'}
city2 = {name: 'Los Angeles', state: 'California'}
city3 = {name: 'Chicago', state: 'Illinois'}
city4 = {name: 'Houston', state: 'Texas'}
city5 = {name: 'Phoenix', state: 'Arizona'}
city6 = {name: 'Philadelphia', state: 'Pennsylvania'}
city7 = {name: 'San Antonio', state: 'Texas'}
city8 = {name: 'San Diego', state: 'California'}

[ city1, city2, city3, city4, city5, city6, city7, city8 ].each do |attributes|
  city = City.create!(attributes)
  puts "Created #{city.name}"
end
puts "Finished!"

puts "Creating officers .."
32.times do
    Officer.create(
        first_name: Faker::Name.male_first_name,
        last_name: Faker::Name.last_name,
        badge_number: Faker::IDNumber.spanish_citizen_number,
        department: Faker::Address.community,
        city: City.all.sample
      )
end




# HAROLD's CODE

officers = Officer.all

officers.each do |officer|

    10.times do
        report = Report.new
        report.content = Faker::Lorem.sentence(word_count: 12)
        report.address = Faker::Address.full_address
        report.officer = officer
        report.user = User.first
        report.city = City.all.sample
        report.evaluation = %w(positive negative neutral).sample
        report.save!
    end

end


puts "Creating tags..."

# tags = %w(Physical-Assault Weapon-Used Racist-Remark Racially-Profiled Excessive-Force Verbal-Abuse Chokehold)

tag1 = {name: 'Weapon Used', info: 'The officer used a weapon.'}
tag2 = {name: 'Physical Assault', info: 'The officer physically assaulted me.'}
tag3 = {name: 'Weapon Used', info: 'The officer used a weapon against me, like a taser, baton, pepper spray, gun, etc.'}
tag4 = {name: 'Racially Profiled', info: 'The officer only stopped me because of my skin color. I was doing nothing wrong.'}
tag5 = {name: 'Excessive Force', info: 'The officer used an unnecessary amount of force to hold me.'}
tag6 = {name: 'Community Involvement', info: 'The officer is engaged in our community.'}
tag7 = {name: 'Education', info: 'The officer taught participated in an event where he taught the community something new.'}
tag8 = {name: 'Chokehold', info: 'The officer held me in a chokehold'}

[ tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag8 ].each do |attributes|
  tag = Tag.create!(attributes)
  puts "Created #{tag.name}"
end

# 500.times do
#   report_tag = ReportTag.new
#   report_tag.report = Report.all.sample
#   report_tag.tag = Tag.all.sample
#   report_tag.save!
# end

# puts "Finished!"


# cities = City.all

# cities.each do |city|
#     puts "populating database"
#     city.use_of_force_incidents = rand(1000..5000).to_i

#     city.use_of_force_weapons = rand(500..1000).to_i
#     city.use_of_force_unarmed = city.use_of_force_incidents - city.use_of_force_weapons
#     city.complaints_against_police = city.use_of_force_incidents - rand(500..700).to_i
#     city.save!


# end



