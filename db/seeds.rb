# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create!( name: '1' ,  year: '10' ,
    description:'説明1',image_url:'https://picsum.photos/200/300',
    is_showing: 0);

Movie.create!(name: '2' ,  year: '20' ,
    description:'説明2',image_url:'https://picsum.photos/200/300',
    is_showing: 1);

5.times do |i|
    Sheet.create(column: "#{i+1}", row: "a")
end

5.times do |j|
    Sheet.create(column: "#{j+1}", row: "b")
end

5.times do |n|
    Sheet.create(column: "#{n+1}", row: "c")
end

Schedule.create!(movie_id:"1",start_time: "2022-01-01 19:30:00 UTC", end_time: "2022-01-01 18:30:00 UTC")
Schedule.create!( movie_id:"2",start_time: "2022-01-18 9:30 UTC", end_time: "2022-01-18 10:00 UTC")
Schedule.create!(movie_id:"1",start_time: "2022-09-01 18:30 UTC", end_time: "2022-09-01 20:30 UTC")
Schedule.create!( movie_id:"2",start_time: "2022-06-01 7:30 UTC", end_time: "2022-06-01 9:00 UTC")
Schedule.create!(movie_id:"1",start_time: "2023-01-08 10:30 UTC", end_time: "2023-01-08 12:30 UTC")
Schedule.create!( movie_id:"2",start_time: "2022-07-01 11:30 UTC", end_time: "2022-07-01 14:00 UTC")