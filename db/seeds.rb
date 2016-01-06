# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.first_or_create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# seeding cities and capitals
require 'net/http'
require 'json'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    puts "generating states and cities"
    states.each do |state|
      state_obj = State.new(:acronym => state["acronym"], :name => state["name"])
      state_obj.save

      state["cities"].each do |city|

        c = City.new
        c.name = city
        c.state = state_obj
        c.capital = capital?(city, state)
        c.save
      end
    end unless State.exists? && City.exists?
  end
end

BRPopulate.populate

puts "Generating 50 cars and buyers..."
50.times do |count|

  if count % 2 == 0
    name = Faker::Name.name
    @buyer = Person.create(name: name, email: Faker::Internet.email(name), rg: Faker::Number.number(9), cpf: Faker::Number.number(11), phone: Faker::PhoneNumber.phone_number)
  else
    name = Faker::Company.name
    @buyer = Company.create(name: name, cnpj: Faker::Number.number(14), email: Faker::Internet.email(name), phone: Faker::PhoneNumber.phone_number)
  end
  plate = "#{(0...3).map { (65 + rand(26)).chr }.join}-#{Faker::Number.number(4)}"
  car = Car.create(plate: plate, model: Faker::Hipster.words(2).join(" "), buyer: @buyer, delivery_status: Faker::Number.between(1,8))
end

puts "Done!"
