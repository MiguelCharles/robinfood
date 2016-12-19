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

User.create(username:"Exki", email:"admin@exki.com", password:"123456", address: "Bruxelles", facebook_picture_url: "exki.jpg")
User.create(username:"François", email:"francois@gmail.com", password:"123456" , address: "Louvain-La-Neuve", facebook_picture_url:"user/francois2.jpg")
User.create(username:"Martin",email:"martin.bragard@robinfood.store", password:"Classico2011.", address: "Liège", facebook_picture_url:"user/MartinB.jpg", admin: true)
User.create(username:"Dandoy",email:"admin@dandoy.com", password:"123456" , address: "Anderlecht", facebook_picture_url:"MaisonDandoy.jpg")
User.create(username:"Marcel",email:"admin@marcel.com", password:"123456" , address: "Verviers", facebook_picture_url:"Marcel.jpg")
User.create(username:"Sushi Shop",email:"admin@sushishop.com", password:"123456" , address: "Bruxelles", facebook_picture_url:"sushishop.jpg")
User.create(username:"Eat & Drink",email:"admin@eatanddrink.com", password:"123456" , address: "Bruxelles", facebook_picture_url:"eatanddrink.jpg")

Shop.create(user_id: User.all.first.id, name_of_the_store: "Exki", photo_url: "exki.jpg", category:"Grand Place", description: "Cuisiner des produits de saison, valoriser les végétaux, donner la préférence aux agriculteurs respectueux de la planès", phone_number: "+32 479 22 55 66", VAT_number: "ABCD", country:"Belgium", city:"Brussels", zip_code: 1000, address:"
Rue du Marché aux Herbes", street_number: 93)
id = (User.all.last.id) - 1
Shop.create(user_id: id, name_of_the_store: "Maison Dandoy", photo_url: "Dandoy.jpg", category:"Biscuiterie", description:"We want to manke your sense dance", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Bruxelles", zip_code: 1000, address:"Rue au Beurre", street_number: 31)
Shop.create(user_id: id, name_of_the_store: "Chez Marcel", photo_url: "Marcel.jpg", category:"Grocery", description: "Votre boulanger de tradition qui aime le gout", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Ixelles", zip_code: 1050, address:"Avenue Louise", street_number: 200)
Shop.create(user_id: id, name_of_the_store: "Sushi Shop", photo_url: "sushishop.jpg.jpg", category:"Sushis", description: "Restaurant japonais", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Bruxelles", zip_code: 1000, address:"Place du Grand Sablon", street_number: 10)
Shop.create(user_id: User.all.last.id, name_of_the_store: "Eat & Drink", photo_url: "eatanddrink.jpg.jpg", category:"Sandwich & soup", description: "Best place for a hot lunch", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Bruxelles", zip_code: 1000, address:"Rue des Colonies", street_number: 50)

ingredients = ["Fruit", "Vegetable", "Bread", "Christmas", "Sushis", "Pasta", "Soup"]

fruits_t = ["Jonnagold Apple", "Orange from Valencia", "Belgian Pear Doyen", "Strawberry from Wepion"]
fruits_tpic = ["food/fruits/apple.jpg","food/fruits/orange.jpg", "food/fruits/night.jpg","food/fruits/strawberry.jpg"]


vegetables_t = ["Cabbages", "Celery", "Zuchini", "Spinach", "Sweet Potato"]
vegetables_tpic = ["food/vegetables/potatoes.jpg","food/vegetables/celery.jpg", "food/vegetables/zuchini.jpg", "food/vegetables/salad.jpg","food/vegetables/sweet-potatoe.jpg"]

breads_t = ["Cougnou", "Cramique", "Croissant", "Baguette"]
breads_tpic = ["food/bread/cougnou.jpg","food/bread/complete.jpg","food/bread/croissant.jpg","food/bread/baguette.jpg"]

sandwich_t = ["John", "Luca", "Louisa","Big Poulet", "Brocoli soup", "DeliEggs"]
sandwich_tpic = ["food/sandwich/cornichon.jpg","food/sandwich/roasted.jpg","food/sandwich/tomato.jpg","food/sandwich/salami.jpg","sandwich.jpg", "food/sandwich/salami.jpg" ]

christmas_t = ["chutney", "chocolate cake","cupcake", "gingerbread"]
christmas_tpic = ["food/christmas/confiture.jpg","food/christmas/chocolate.jpg", "food/christmas/cupcake.jpg","food/christmas/cookies.jpg"]

sushi_t = ["Lunch Box", "Sushi Box"]
sushi_tpic = ["sushis1.jpg","sushis2.jpg"]

pasta_t = ["Carbonara", "Bolognese"]
pasta_tpic = ["carbo.jpg","bolo3.jpg"]

soup_t = ["Brocoli soup", "Fish soup"]
soup_tpic = ["soupe_verte.jpg","soupe_orange.jpg"]


 shop_id = Shop.all.first.id
 shop = Shop.find(shop_id)
 product_type = "Sandwich"
 for index in 0 ... sandwich_t.size
    title = sandwich_t[index]
    photo_url = sandwich_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (4..6).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 p discount
 discount2 = 1 - discount[rand(0..6)]
 p discount2
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 p initial_price_per_unit
 p price_after_promotion_per_unit
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "Piece(s)",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.first.id + 2
 shop = Shop.find(shop_id)
 product_type = "Fruit"
 for index in 0 ... fruits_t.size
    title = fruits_t[index]
    photo_url = fruits_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (1..3).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 discount2 = 1 - discount[rand(0..6)]
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "kg",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.first.id + 2
 shop = Shop.find(shop_id)
 product_type = "Vegetable"
 for index in 0 ... vegetables_t.size
    title = vegetables_t[index]
    photo_url = vegetables_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (2..5).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 discount2 = 1 - discount[rand(0..6)]
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "kg",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end

 shop_id = Shop.all.first.id + 1
 shop = Shop.find(shop_id)
 product_type = "Bread"
 for index in 0 ... breads_t.size
    title = breads_t[index]
    photo_url = breads_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (2..6).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 discount2 = 1 - discount[rand(0..6)]
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "piece",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.first.id + 2
 shop = Shop.find(shop_id)
 product_type = "Christmas"
 for index in 0 ... christmas_t.size
    title = christmas_t[index]
    photo_url = christmas_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (3..7).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 discount2 = 1 - discount[rand(0..6)]
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "piece",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end

shop_id = Shop.all.last.id - 1
 shop = Shop.find(shop_id)
 product_type = "Sushis"
 for index in 0 ... sushi_t.size
    title = sushi_t[index]
    photo_url = sushi_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (10..15).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 p discount
 discount2 = 1 - discount[rand(0..6)]
 p discount2
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 p initial_price_per_unit
 p price_after_promotion_per_unit
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "Piece(s)",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Soup"
 for index in 0 ... sushi_t.size
    title = soup_t[index]
    photo_url = soup_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (3..6).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 p discount
 discount2 = 1 - discount[rand(0..6)]
 p discount2
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 p initial_price_per_unit
 p price_after_promotion_per_unit
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "Piece(s)",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end

  shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Pasta"
 for index in 0 ... sushi_t.size
    title = pasta_t[index]
    photo_url = pasta_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (8..12).to_a.sample
 discount = [0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
 p discount
 discount2 = 1 - discount[rand(0..6)]
 p discount2
 price_after_promotion_per_unit = (initial_price_per_unit*(1- discount2)).to_f
 p initial_price_per_unit
 p price_after_promotion_per_unit
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "Piece(s)",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..36000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end
