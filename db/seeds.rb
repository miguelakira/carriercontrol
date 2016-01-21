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
    end
  end
end

BRPopulate.populate unless State.exists? && City.exists?

puts "Generating 50 cars and clients..."
10.times do |count|

  if count % 2 == 0
    name = Faker::Name.name
    @client = Person.create(
      name: name,
      email: Faker::Internet.email(name),
      rg: Faker::Number.number(9),
      cpf: CPF.generate(true),
      phone: Faker::PhoneNumber.phone_number
    )
  else
    name = Faker::Company.name
    @client = Company.create(
      name: name,
      cnpj: CNPJ.generate(true),
      email: Faker::Internet.email(name),
      phone: Faker::PhoneNumber.phone_number
    )
  end

  5.times do
    plate = "#{(0...3).map { (65 + rand(26)).chr }.join}-#{Faker::Number.number(4)}"
    puts "Creating car #{plate} for client #{@client.name}"

    car = Car.create(
      plate: plate,
      model: Faker::Hipster.words(2).join(" "),
      client: @client,
      delivery_status: Faker::Number.between(0,6)
    )

    freight = car.create_freight(
      subtotal: Faker::Commerce.price,
      ferry: Faker::Commerce.price,
      platform: Faker::Commerce.price,
      redispatching: Faker::Commerce.price,
      platform_origin: Faker::Commerce.price,
      platform_destination: Faker::Commerce.price,
      discount: Faker::Commerce.price,
      client: @client
    )

    car.create_location(
      origin_id: Faker::Number.between(1,5000),
      destination_id: Faker::Number.between(1,5000),
      current_id: Faker::Number.between(1,5000)
    )
  end

  Faker::Number.between(1, 3).times { @client.finance.payments.create(value: Faker::Commerce.price) }

end

puts "Done!"
