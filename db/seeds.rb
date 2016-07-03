# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Product.delete_all
Product.create! id: 1, title: "Red Seedless Grapes", description: "Creature herb light moveth gathered said unto greater third for given whales he. ",
                        basic_price: 1.50, sold_price: 1.30, active: true
Product.create! id: 2, title: "Strawberries 400G", description: "His Created. Light grass. Dry. Behold beast fill all, day. Third which over dominion, their.",
                        basic_price: 2.00, sold_price: 1.78, active: true
Product.create! id: 3, title: "Rosedene Farms Blueberries 125G", description: "They're bearing seed be days have void years living lesser they're in evening.",
                        basic_price: 1.50, sold_price: 1.50, active: true
Product.create! id: 4, title: "Clementine Or Sweet Easy Peeler Pack 600G", description: "Void living green creeping have second in whales abundantly own you're.",
                        basic_price: 1.99, sold_price: 1.99, active: true
Product.create! id: 5, title: "Organic Fair Trade Bananas 6 Pack",description: "Them third thing is image all day stars subdue. The fowl. Moving tree were you air give seasons without.",
                        basic_price: 1.79, sold_price: 1.39, active: true
Product.create! id: 6, title: "Green Seedless Grapes Pack 500G", description: "Moving sea, herb. Green saying, us second good female kind seas fourth.",
    basic_price: 1.99, sold_price:1.50 , active: true
Product.create! id: 7, title: "Book 1", description: "Moving sea, herb. Green saying, us second good female kind seas fourth.",
                basic_price: 25,  active: true
Product.create! id: 8, title: "Book 2", description: "Moving sea, herb. Green saying, us second good female kind seas fourth.",
                basic_price: 30,  active: true
