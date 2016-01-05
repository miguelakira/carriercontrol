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

  buyer = ""
  if count % 2 == 0
    buyer = Person.create(name: "nome #{count}", email: "email #{count}", rg: "rg #{count}", cpf: "cpf #{count}")
  else
    buyer = Company.create(name: "nome companhia #{count}", cnpj: "cnpj #{count}", email: "email #{count}")
  end

  Car.create(plate: "placa-#{count}", model: "modelo-#{count}", buyer: buyer)
end

puts "Done!"
