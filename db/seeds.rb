# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p1 = Player.create!(name: 'Ife Runsewe', email: 'iferunsewe@email.com', password: 'password', admin: true)
p2 = Player.create!(name: 'Alex Ames', email: 'alexames@email.com', password: 'password', admin: true)

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
