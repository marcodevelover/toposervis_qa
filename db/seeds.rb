# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(description: "admin")
User.create(email: "admin@email.com.mx", name: "admin", lastname: "admin", password: "12345678", phone: "1234567890", role_id: 1)
