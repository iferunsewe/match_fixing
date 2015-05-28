# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.create([
                { name: 'The Neville wears Prada' },
                { name: 'Petr Cech Yourself' },
                { name: 'Rodallega Bombs' },
                { name: 'Chamakh My Pitch Up' },
                { name: 'Ruud Van Nipplejoy' }
            ])

Player.create([
                  {name: 'Dmitry Kombarov', team_id: Team.where(name: 'The Neville wears Prada')},
                {name: 'Glen Johnson', team_id: Team.where(name: 'Petr Cech Yourself')},
                {name: 'Phil Jagielka', team_id: Team.where(name: 'Rodallega Bombs')},
                {name: 'Johan Djourou', team_id: Team.where(name: 'Chamakh My Pitch Up')},
                {name: 'Guillermo Ochoa', team_id: Team.where(name: 'Ruud Van Nipplejoy')},
                {name: 'Ricardo Rodriguez', team_id: Team.where(name: 'The Neville wears Prada')},
                {name: 'Alejandro Bedoya', team_id: Team.where(name: 'Petr Cech Yourself')},
                {name: 'Rafael Marquez', team_id: Team.where(name: 'Rodallega Bombs')},
                {name: 'Yuya Osako', team_id: Team.where(name: 'Chamakh My Pitch Up')},
                {name: 'Andrey Eschenko', team_id: Team.where(name: 'Ruud Van Nipplejoy')},
                {name: 'Daniel Van Buyten' , team_id: Team.where(name: 'The Neville wears Prada')},
                {name: 'Godfrey Oboabona', team_id: Team.where(name: 'Petr Cech Yourself')},
                {name: 'Khosro Heydari', team_id: Team.where(name: 'Rodallega Bombs')},
                {name: 'Andres Guardado', team_id: Team.where(name: 'Chamakh My Pitch Up')},
                {name: 'Gervinho', team_id: Team.where(name: 'Ruud Van Nipplejoy')}
            ])