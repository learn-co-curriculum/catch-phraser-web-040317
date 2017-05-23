# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

student = Student.create(
  name: 'Jonny',
  email: 'jonny@jonny.com',
  phone: '555-5555'
)

student.catch_phrases.create(
  suitable_for_work: true,
  mood: 'angry',
  content: 'I pity the fool'
)

student.catch_phrases.create(
  suitable_for_work: true,
  mood: 'funny',
  content: "You're only supposed to blow the bloody doors off"
)
