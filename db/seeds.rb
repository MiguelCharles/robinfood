# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
Promotion.destroy_all
Shop.destroy_all
User.destroy_all

User.create(username:"Paul", email:"paul@gmail.com", password:"123456" ,address: "Bruxelles")
User.create(username:"Martin", email:"paul1@gmail.com", password:"123456" ,address: "Louvain-La-Neuve")
User.create(username:"François",email:"paul2@gmail.com", password:"123456" , address: "Liège")
User.create(username:"David",email:"paul3@gmail.com", password:"123456" , address: "Anderlecht")
User.create(username:"George",email:"paul4@gmail.com", password:"123456" , address: "Verviers")

Shop.create(user_id: User.all.first.id, name_of_the_store: "Chez Paul", category:"Boucherie", description: "Votre boucher à Art-loi depuis 150 ans", phone_number: "+32 479 22 55 66", VAT_number: "ABCD")
Shop.create(user_id: User.all.last.id, name_of_the_store: "Chez Marcel", category:"Boulangerie", description: "Votre boulanger Rue Marie-Thérèse 150 ans", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY")

ingredients = ["Carots", "Croissants", "Sandwiches", "Oranges"]


5.times do
 unit1 = ["Kg","piece(s)"]
 unit2 = unit1[rand(0..1)]
 product_type = ingredients.sample
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..40).to_a.sample
 price_after_promotion_per_unit = initial_price_per_unit/2
 Promotion.create(shop_id: Shop.all.sample.id,
 product_type: product_type,
 initial_quantity: initial_quantity,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: unit2,
 title: "#{initial_quantity}#{unit2} of #{product_type} at #{price_after_promotion_per_unit}€",
 validity: Time.now + (1..5).to_a.sample,
 promotion_status: true,
 digits_code: (1000..9999).to_a.sample,
 initial_price_per_unit: initial_price_per_unit,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
end
