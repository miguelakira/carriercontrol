# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.first_or_create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

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