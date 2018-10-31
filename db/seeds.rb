require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name

    listing['bedrooms'] = rand(1..5)
    listing['beds'] = rand(1..6)
    listing['guests'] = rand(1..10)
    listing['baths'] = rand(1..5)
    listing['sleeping_arrangements'] = Faker::Fallout.quote

    listing['address'] = Faker::Address.country
    listing['address'] = Faker::Address.state
    listing['address'] = Faker::Address.city
    listing['address'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address

    listing['price_per_day'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end