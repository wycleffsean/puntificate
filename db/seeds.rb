# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
	name: "test_user",
	email: "fake@aol.com",
	password: "password",
	password_confirmation: "password"
)
user.save

challenge = user.challenges.build(
  body: 'Ex-NBA player lived with guns, feces',
  url: 'www.cnn.com/video/2.0/video/sports/2013/03/06/pkg-former-nba-star-lived-in-filthy-mansion.komo.html'
)
challenge.save

response = challenge.responses.build( body: 'What a shitty player', challenge: challenge )
response.user = user
response.save