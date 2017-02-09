# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.new(email: "testemail.yahoo.never").save
a = User.first
ShortenedUrl.create!(a,"Hohohoh")
b = ShortenedUrl.first
Visit.record_visit!(a,b)
User.new(email: "2ndemail.yahoo.never").save
a = User.last
ShortenedUrl.create!(a,"Noooooo")
b = ShortenedUrl.last
Visit.record_visit!(a,b)
a = User.first
b = ShortenedUrl.last
Visit.record_visit!(a,b)
