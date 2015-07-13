# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
T1 = Team.create!(name: 'The Neville wears Prada')
T2 = Team.create!(name: 'Petr Cech Yourself' )
T3 = Team.create!(name: 'Rodallega Bombs')
T4 = Team.create!(name: 'Chamakh My Pitch Up')
T5 = Team.create!(name: 'Ruud Van Nipplejoy')

P1 = Player.create!(name: 'Dmitry Kombarov', team_id: T1.id, email: 'test1@email.com', password: 'password')
P2 = Player.create!(name: 'Glen Johnson', team_id: T2.id, email: 'test2@email.com', password: 'password')
P3 = Player.create!(name: 'Phil Jagielka', team_id: T3.id, email: 'test3@email.com', password: 'password')
P4 = Player.create!(name: 'Johan Djourou', team_id: T4.id, email: 'test@4email.com', password: 'password')
P5 = Player.create!(name: 'Ricardo Rodriguez', team_id: T5.id, email: 'test5@email.com', password: 'password')
P6 = Player.create!(name: 'Alejandro Bedoya', team_id: T1.id, email: 'test6@email.com', password: 'password')
P7 = Player.create!(name: 'Rafael Marquez', team_id: T2.id, email: 'test7@email.com', password: 'password')
P8 = Player.create!(name: 'Yuya Osako', team_id: T3.id, email: 'test8@email.com', password: 'password')
P9 = Player.create!(name: 'Andrey Eschenko', team_id: T4.id, email: 'test9@email.com', password: 'password')
P10 = Player.create!(name: 'Andrey Eschenko', team_id: T5.id, email: 'test10@email.com', password: 'password')
P11 = Player.create!(name: 'Daniel Van Buyten', team_id: T1.id, email: 'test11@email.com', password: 'password')
P12 = Player.create!(name: 'Godfrey Oboabona', team_id: T2.id, email: 'test12@email.com', password: 'password')
P13 = Player.create!(name: 'Khosro Heydari', team_id: T3.id, email: 'test13@email.com', password: 'password')
P14 = Player.create!(name: 'Andres Guardado', team_id: T4.id, email: 'test14@email.com', password: 'password')
P15 = Player.create!(name: 'Gervinho', team_id: T5.id, email: 'test15@email.com', password: 'password')

g1 = Ground.create!(name: "St James Park", address: "Barrack Road, Newcastle upon Tyne, NE1 4ST", image: File.open(File.join(Rails.root,"/app/assets/images/st-james-park.jpg")))

m1 = Match.create!(date: DateTime.parse("01/08/2015 15:00"), status: false, team_a_score: nil, team_b_score: nil, team_a_id: T1.id, team_b_id: T3.id, ground_id: g1.id)
m2 = Match.create!(date: DateTime.parse("02/01/2015 15:00"), status: true, team_a_score: 4, team_b_score: 5, team_a_id: T4.id, team_b_id: T2.id, ground_id: g1.id)
m3 = Match.create!(date: DateTime.parse("01/07/2015 15:00"), status: true, team_a_score: 2, team_b_score: 0, team_a_id: T5.id, team_b_id: T4.id, ground_id: g1.id)
m4 = Match.create!(date: DateTime.parse("01/08/2015 15:00"), status: false, team_a_score: nil, team_b_score: nil, team_a_id: T2.id, team_b_id: T3.id, ground_id: g1.id)







