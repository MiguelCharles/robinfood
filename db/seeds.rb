# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(username:" Miguel", email:"mixcharles@gmail.com", password:"xx", address: "Bruxelles")
User.create(username:" Martin", email:"Martin@gmail.com", password:"xoxo", address: "Louvain-La-Neuve")
User.create(username:" François", email:"Francois@gmail.com", password:"xixi", address: "Liège")
User.create(username:" David", email:"David@gmail.com", password:"xaxa", address: "Anderlecht")
