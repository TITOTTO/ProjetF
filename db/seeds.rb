# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


10.times do
    User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, password: Faker::Alphanumeric.alphanumeric(number: 10))
end

Category.create!(kind: "Console")
Category.create!(kind: "Jeux video")
Console.create!(typeconsole: "Nes")
Console.create!(typeconsole: "Super")
Console.create!(typeconsole: "PS1")

Article.create!(title: "Console PS1", content: Faker::ChuckNorris.fact, category_id: 1, console_id: 3, price: 200, seller: User.all.sample, image: "ps1.jpg")
Article.create!(title: "Console Nes", content: Faker::ChuckNorris.fact, category_id: 1, console_id: 1, price: 100, seller: User.all.sample, image: "nes.jpg")
Article.create!(title: "Console Super Nes", content: Faker::ChuckNorris.fact, category_id: 1, console_id: 2, price: 150, seller: User.all.sample, image: "supernes.jpg")
Article.create!(title: "Jeux Spyro", content: Faker::ChuckNorris.fact, category_id: 2, console_id: 3, price: 60, seller: User.all.sample, image: "spyro.jpg")
Article.create!(title: "Jeux Yoshi", content: Faker::ChuckNorris.fact, category_id: 2, console_id: 2, price: 50, seller: User.all.sample, image: "yoshi.jpg")
Article.create!(title: "Jeux Mario", content: Faker::ChuckNorris.fact, category_id: 2, console_id: 1, price: 40, seller: User.all.sample, image: "mario.jpg")