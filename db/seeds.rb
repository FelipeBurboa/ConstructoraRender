# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
#
#10.times do |index|
#    Brand.create!(
#        name: Faker::Company.name
#    )
#end
#
#10.times do |index|
#    Category.create!(
#        name: Faker::Commerce.material
#    )
#end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
#User.create!(email: '1@example.com', name: 'Esteban', role: 0, password: 'password', password_confirmation: 'password')
#User.create!(email: '2@example.com', name: 'Omar', role: 1, password: 'password', password_confirmation: 'password')
#User.create!(email: '3@example.com', name: 'Ramon', role: 2, password: 'password', password_confirmation: 'password')