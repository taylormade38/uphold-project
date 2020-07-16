require 'json'
require 'open-uri'
# require 'faker'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
ReportVote.destroy_all
ReportBookmark.destroy_all
Report.destroy_all
Officer.destroy_all
User.destroy_all
City.destroy_all
ReportTag.destroy_all
Tag.destroy_all




5.times do
  User.create!(email: Faker::Internet.email, password: 'password', city: City.all.sample )
end
puts "Creating cities..."
city1 = {name: 'New York', state: 'New York'}
city2 = {name: 'Los Angeles', state: 'California'}
city3 = {name: 'Chicago', state: 'Illinois'}
city4 = {name: 'Houston', state: 'Texas'}
city5 = {name: 'Phoenix', state: 'Arizona'}
city6 = {name: 'Philadelphia', state: 'Pennsylvania'}
city7 = {name: 'San Antonio', state: 'Texas'}
city8 = {name: 'San Diego', state: 'California'}
city9 = {name: 'Minneapolis', state: 'Minnesota'}
city10 = {name: 'Orlando', state: 'Florida'}
city11 = {name: 'Seattle', state: 'Washington'}
city12 = {name: 'San Francisco', state: 'California'}
city13 = {name: 'Denver', state: 'Colorado'}
city14 = {name: 'Boston', state: 'Massachusetts'}
city15 = {name: 'Nashville', state: 'Tennessee'}
city16 = {name: 'Columbus', state: 'Ohio'}


[ city1, city2, city3, city4, city5, city6, city7, city8, city9, city10, city11, city12, city13, city14, city15, city16 ].each do |attributes|

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

url = 'https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-all.json'
addresses_serialized = open(url).read
addresses = JSON.parse(addresses_serialized)
cities = addresses["addresses"]
city_names = City.all.pluck(:name)
cities.select! { |city_hash| city_names.include?(city_hash["city"])}

report_counter = 0
puts "creating reports"
cities.each do |address|
  report = Report.new
  report.content = Faker::Lorem.sentence(word_count: 12)
  report.address = "#{address["address1"]} #{address["city"]} #{address["state"]}"
  report.officer = Officer.all.sample
  report.user = User.first
  city_name = address["city"]
  city = City.find_by(name: city_name)
  report.city = city
  report.evaluation = %w(positive negative neutral).sample
  report.save!
  report_counter +=1
  p report_counter
end


tag1 = {name: 'Physical Assault', info: 'The officer physically assaulted me.'}
tag2 = {name: 'Excessive Force', info: 'The officer used an unnecessary amount of force to hold me.'}
tag3 = {name: 'Chokehold', info: 'The officer held me in a chokehold.'}
tag4 = {name: 'Weapon Used', info: 'The officer used a weapon against me, like a taser, baton, pepper spray, gun, etc.'}
tag5 = {name: 'Shooting', info: 'The officer shot a gun.'}
tag6 = {name: 'Taser', info: 'The officer used a taser on me.'}
tag7 = {name: 'Rubber Bullets', info: 'The officer shot rubber bullets at me.'}
tag8 = {name: 'Tear Gas', info: 'The officer used tear gas on me.'}
tag9 = {name: 'Baton', info: 'The officer used a baton to hit me.'}
tag10 = {name: 'Racially Profiled', info: 'The officer only stopped me because of my skin color. I was doing nothing wrong.'}
tag11 = {name: 'Verbal Abuse', info: 'The officer said said harmful things.'}
tag12 = {name: 'Hate Speech', info: 'The officer said something hateful towards me.'}
tag13 = {name: 'Racist Remarks', info: 'The officer said something hateful towards me.'}
tag14 = {name: 'Sexist Comments', info: 'The officer said something sexist or inappropriate.'}
tag15 = {name: 'Sexual Harrassment', info: 'The officer sexually harrassed me and made me uncomfortable'}

tag16 = {name: 'Community Involvement', info: 'The officer is engaged in our community.'}
tag17 = {name: 'Kindness', info: 'The officer showed me kindness.'}
tag18 = {name: 'Education', info: 'The officer taught participated in an event where he taught the community something new.'}
tag19 = {name: 'Protection', info: 'The officer protected me in a dangerous situation.'}
tag20 = {name: 'Bravery', info: 'The officer was very brave.'}
tag21 = {name: 'Empathy', info: 'The officer showed empathy towards me.'}




[ tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag8, tag9, tag10, tag11, tag12, tag13, tag14, tag15, tag16, tag17, tag18, tag19, tag20, tag21 ].each do |attributes|
  tag = Tag.create!(attributes)
  puts "Created #{tag.name}"
end

50.times do
  report_tag = ReportTag.new
  report_tag.report = Report.all.sample
  report_tag.tag = Tag.all.sample
  report_tag.save!
end


cities = City.all

cities.each do |city|
    puts "populating database"
    city.use_of_force_incidents = rand(1000..5000).to_i
    city.officer_involved_shootings = rand(50..500).to_i
    city.officer_involved_killings = rand(50..400).to_i
    city.use_of_force_weapons = rand(500..1000).to_i
    city.use_of_force_unarmed = city.use_of_force_incidents - city.use_of_force_weapons
    city.complaints_against_police = city.use_of_force_incidents - rand(500..700).to_i
    city.save!
end


