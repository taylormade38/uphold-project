# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
City.destroy_all

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
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
