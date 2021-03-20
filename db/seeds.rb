# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do |idx|
#   Movie.create(title: "Title #{idx}", year: "2021", genre: "Action", country: "USA")
# end


campanella = Person.create(first_name: "Juan José", last_name: "Campanella") # director, productor
besuievski = Person.create(first_name: "Mariela", last_name: "Besuievski") # productor
urbieta = Person.create(first_name: "Carolina", last_name: "Urbieta") # productor
darin = Person.create(first_name: "Ricardo", last_name: "Darín") # character
villamil = Person.create(first_name: "Soledad", last_name: "Villamil") # character
rago = Person.create(first_name: "Pablo", last_name: "Rago") # character
godino = Person.create(first_name: "Javier", last_name: "Godino") # character
francella = Person.create(first_name: "Guillermo", last_name: "Francella") # character

secreto = Movie.create(title: "El secreto de sus ojos", year: "2009", genre: "Suspenso/Drama", country: "Argentina/España")

secreto.directors << campanella
secreto.producers << [campanella, besuievski, urbieta]
secreto.characters << [darin, villamil, rago, godino, francella]
