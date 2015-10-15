# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# l1 = League.create!(name: 'The League of Extrodinary Teams', location: 'Jesomond')
#
# T1 = Team.create!(name: 'The Neville wears Prada', primary_kit_colour: 'white', secondary_kit_colour: 'black', hometown: 'Jesmond', league_id: l1.id)
# T2 = Team.create!(name: 'Petr Cech Yourself', primary_kit_colour: 'red', secondary_kit_colour: 'white', hometown: 'Jesmond', league_id: l1.id)
# T3 = Team.create!(name: 'Rodallega Bombs', hometown: 'Jesmond', primary_kit_colour: 'green', secondary_kit_colour: 'white', league_id: l1.id)
# T4 = Team.create!(name: 'Chamakh My Pitch Up', primary_kit_colour: 'black', secondary_kit_colour: 'yellow', hometown: 'Jesmond', league_id: l1.id)
# T5 = Team.create!(name: 'Ruud Van Nipplejoy', primary_kit_colour: 'red', secondary_kit_colour: 'blue', hometown: 'Jesmond', league_id: l1.id)
#
# P1 = Player.create!(name: 'Dmitry Kombarov', team_id: T1.id, email: 'test1@email.com', password: 'password')
# P2 = Player.create!(name: 'Glen Johnson', team_id: T2.id, email: 'test2@email.com', password: 'password')
# P3 = Player.create!(name: 'Phil Jagielka', team_id: T3.id, email: 'test3@email.com', password: 'password', captain: true)
# P4 = Player.create!(name: 'Johan Djourou', team_id: T4.id, email: 'test4@email.com', password: 'password')
# P5 = Player.create!(name: 'Ricardo Rodriguez', team_id: T5.id, email: 'test5@email.com', password: 'password')
# P6 = Player.create!(name: 'Alejandro Bedoya', team_id: T1.id, email: 'test6@email.com', password: 'password')
# P7 = Player.create!(name: 'Rafael Marquez', team_id: T2.id, email: 'test7@email.com', password: 'password', captain: true)
# P8 = Player.create!(name: 'Yuya Osako', team_id: T3.id, email: 'test8@email.com', password: 'password')
# P9 = Player.create!(name: 'Andrey Eschenko', team_id: T4.id, email: 'test9@email.com', password: 'password')
# P10 = Player.create!(name: 'Mark Van Bommel', team_id: T5.id, email: 'test10@email.com', password: 'password')
# P11 = Player.create!(name: 'Daniel Van Buyten', team_id: T1.id, email: 'test11@email.com', password: 'password', captain: true)
# P12 = Player.create!(name: 'Godfrey Oboabona', team_id: T2.id, email: 'test12@email.com', password: 'password')
# P13 = Player.create!(name: 'Khosro Heydari', team_id: T3.id, email: 'test13@email.com', password: 'password')
# P14 = Player.create!(name: 'Andres Guardado', team_id: T4.id, email: 'test14@email.com', password: 'password')
# P15 = Player.create!(name: 'Gervinho', team_id: T5.id, email: 'test15@email.com', password: 'password')
p1 = Player.create!(name: 'Ife Runsewe', email: 'iferunsewe@email.com', password: 'password', admin: true)
p2 = Player.create!(name: 'Alex Ames', email: 'alexames@email.com', password: 'password', admin: true)
#
#
#
# g1 = Ground.create!(name: "St James Park", address: "Barrack Road, Newcastle upon Tyne, NE1 4ST", image: File.open(File.join(Rails.root,"/app/assets/images/st-james-park.jpg")))
#
# m1 = Match.create!(date: DateTime.parse("02/01/2015 15:00"), status: true, team_a_score: 4, team_b_score: 5, team_a_id: T4.id, team_b_id: T2.id, ground_id: g1.id)
# m2 = Match.create!(date: DateTime.parse("01/07/2015 15:00"), status: true, team_a_score: 2, team_b_score: 1, team_a_id: T5.id, team_b_id: T4.id, ground_id: g1.id)
# m3 = Match.create!(date: DateTime.parse("01/08/2015 15:00"), status: true, team_a_score: 3, team_b_score: 1, team_a_id: T2.id, team_b_id: T3.id, ground_id: g1.id)
# m4 = Match.create!(date: DateTime.parse("01/08/2015 15:00"), status: true, team_a_score: 0, team_b_score: 0, team_a_id: T1.id, team_b_id: T3.id, ground_id: g1.id)
# m5 = Match.create!(date: DateTime.parse("02/09/2015 15:00"), status: true, team_a_score: 8, team_b_score: 3, team_a_id: T1.id, team_b_id: T5.id, ground_id: g1.id)
# m6 = Match.create!(date: DateTime.parse("23/09/2015 15:00"), team_a_id: T4.id, team_b_id: T1.id, ground_id: g1.id)
# m7 = Match.create!(date: DateTime.parse("24/09/2015 15:00"), team_a_id: T2.id, team_b_id: T5.id, ground_id: g1.id)
# m8 = Match.create!(date: DateTime.parse("27/09/2015 15:00"), team_a_id: T2.id, team_b_id: T1.id, ground_id: g1.id)
# m9 = Match.create!(date: DateTime.parse("28/09/2015 15:00"), team_a_id: T5.id, team_b_id: T3.id, ground_id: g1.id)
# m10 = Match.create!(date: DateTime.parse("01/10/2015 15:00"), team_a_id: T3.id, team_b_id: T4.id, ground_id: g1.id)
#
# # Stat id ascend on the team_a player ids in descending order and then the same for team b. e.g. for the first match the first stat would be for
# # player 14, then player 9, then player 4 and then on team_b, player 12, player 7, player 2
#
# # Match 1
# s1 = Stat.update(1, goals: 1)
# s2 = Stat.update(2, goals: 2, man_of_the_match: true)
# s3 = Stat.update(3, goals: 2)
# s4 = Stat.update(4, goals: 3)
# s5 = Stat.update(5, goals: 1)
#
# # Match 2
# s6 = Stat.update(7, goals: 1)
# s7 = Stat.update(8, goals: 1)
# s8 = Stat.update(10, goals: 1)
# s9 = Stat.update(9, man_of_the_match: true)
#
# # Match 3
# s10 = Stat.update(15, goals: 2, man_of_the_match: true)
# s11 = Stat.update(13, goals: 1)
# s12 = Stat.update(17, goals: 1)
#
# # Match 4
# s13 = Stat.update(19, man_of_the_match: true)
#
# # Match 5
# s14 = Stat.update(25, goals: 4, man_of_the_match: true)
# s15 = Stat.update(26, goals: 2)
# s16 = Stat.update(27, goals: 2)
# s17 = Stat.update(29, goals: 2)
# s17 = Stat.update(30, goals: 1)
#
# # Specialties

sp1 = Speciality.create!(name: 'Speedster', image: 'speedster.jpg')
sp2 = Speciality.create!(name: 'The Canon', image: 'the_canon.jpg')
sp3 = Speciality.create!(name: 'The Wall', image: 'the_wall.jpg')
sp4 = Speciality.create!(name: 'Organiser', image: 'organiser.jpg')
sp5 = Speciality.create!(name: 'Playmaker', image: 'playmaker.jpg')
sp6 = Speciality.create!(name: 'Pretty Boy', image: 'pretty_boy.jpg')
sp7 = Speciality.create!(name: 'Leader of Men', image: 'leader_of_men.jpg')
sp8 = Speciality.create!(name: 'Poacher', image: 'poacher.jpg')
sp9 = Speciality.create!(name: 'Aerial Threat', image: 'aerial_threat.jpg')
sp10 = Speciality.create!(name: 'Target Man', image: 'target_man.jpg')
