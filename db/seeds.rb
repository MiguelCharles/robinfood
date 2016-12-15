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

User.create(username:"Exki", email:"admin@exki.com", password:"123456" ,address: "Bruxelles")
User.create(username:"François", email:"françois@gmail.com", password:"123456" ,address: "Louvain-La-Neuve")
User.create(username:"François",email:"paul2@gmail.com", password:"123456" , address: "Liège")
User.create(username:"Dandoy",email:"admin@dandoy.com", password:"123456" , address: "Anderlecht")
User.create(username:"Marcel",email:"admin@marcel.com", password:"123456" , address: "Verviers")

Shop.create(user_id: User.all.first.id, name_of_the_store: "Exki", photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/XVvCWFEQSg_nN3ISlYGlQw/348s.jpg", category:"Grand Place", description: "Cuisiner des produits de saison, valoriser les végétaux, donner la préférence aux agriculteurs respectueux de la planès", phone_number: "+32 479 22 55 66", VAT_number: "ABCD", country:"Belgium", city:"Brussels", zip_code: 1000, address:"
Rue du Marché aux Herbes", street_number: 93)
id = (User.all.last.id) - 1
Shop.create(user_id: id, name_of_the_store: "Maison Dandoy", photo_url: "http://www.maisondandoy.com/files/cache/440764e44fb323da1705f9ef56a869fe.jpg", category:"Biscuiterie", description:"We want to manke your sense dance", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Bruxelles", zip_code: 1000, address:"Rue au Beurre", street_number: 31)
Shop.create(user_id: User.all.last.id, name_of_the_store: "Chez Marcel", photo_url: "http://www.elle.be/fr/wp-content/uploads/2016/08/marcel.jpg", category:"Fine Grocery", description: "Votre boulanger de tradition qui aime le gout", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Ixelles", zip_code: 1050, address:"Avenue Louise", street_number: 200)

ingredients = ["Fruit", "Vegetable", "Bread", "Christmas"]

fruits_t = ["Jonnagold Apple", "Orange from Valencia"]
fruits_tpic = ["food/fruits/apple.jpg","food/fruits/orange.jpg"]


vegetables_t = ["Cabbages", "Celery", "Zuchini"]
vegetables_tpic = ["food/vegetables/potatoes.jpg","food/vegetables/celery.jpg", "food/vegetables/zuchini.jpg"]

breads_t = ["Cougnou", "Cramique"]
breads_tpic = ["food/bread/cougnou.jpg","food/bread/complete.jpg"]

sandwich_t = ["John", "Luca", "Louisa"]
sandwich_tpic = ["food/sandwich/cornichon.jpg","food/sandwich/roasted.jpg","food/sandwich/tomato.jpg" ]

christmas_t = ["chutney", "chocolate cake"]
christmas_tpic = ["food/christmas/confiture.jpg","food/christmas/chocolate.jpg"]

fruits_f = [ "Belgian Pear Doyen", "Strawberry from Wepion"]
fruits_fpic = ["food/fruits/night.jpg","food/fruits/strawberry.jpg"]


vegetables_f = ["Spinach", "Sweet Potato"]
vegetables_fpic = ["food/vegetables/salad.jpg","food/vegetables/sweet-potatoe.jpg"]

breads_f = ["Croissant", "Baguette"]
breads_fpic = ["food/bread/croissant.jpg","food/bread/baguette.jpg"]

sandwich_f = ["Big Poulet", "Marcos", "DeliEggs"]
sandwich_fpic = ["food/sandwich/salami.jpg","food/sandwich/tomato.jpg", "food/sandwich/salami.jpg"]

christmas_f = ["cupcake", "gingerbread"]
christmas_fpic = ["food/christmas/cupcake.jpg","food/christmas/cookies.jpg"]



 shop_id = Shop.all.first.id
 shop = Shop.find(shop_id)
 product_type = "Sandwich"
 for index in 0 ... sandwich_t.size
    title = sandwich_t[index]
    photo_url = sandwich_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.85]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = (initial_price_per_unit*discount2).to_f
 p (initial_price_per_unit*discount2).to_f
 p price_after_promotion_per_unit
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "Piece(s)",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: (1..10).to_a.sample,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Fruit"
 for index in 0 ... fruits_t.size
    title = fruits_t[index]
    photo_url = fruits_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "kg",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Vegetable"
 for index in 0 ... vegetables_t.size
    title = vegetables_t[index]
    photo_url = vegetables_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "kg",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end

 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Bread"
 for index in 0 ... breads_t.size
    title = breads_t[index]
    photo_url = breads_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "piece",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id - 1
 shop = Shop.find(shop_id)
 product_type = "Christmas"
 for index in 0 ... christmas_t.size
    title = christmas_t[index]
    photo_url = christmas_tpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "pece",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: true,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end

# FALSE

 shop_id = Shop.all.first.id
 shop = Shop.find(shop_id)
 product_type = "Sandwich"
 for index in 0 ... sandwich_t.size
    title = sandwich_f[index]
    photo_url = sandwich_fpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "piece",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: false,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Fruit"
 for index in 0 ... fruits_t.size
    title = fruits_f[index]
    photo_url = fruits_fpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "kg",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: false,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Vegetable"
 for index in 0 ... vegetables_f.size
    title = vegetables_f[index]
    photo_url = vegetables_fpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "kg",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: false,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end

 shop_id = Shop.all.last.id
 shop = Shop.find(shop_id)
 product_type = "Bread"
 for index in 0 ... breads_t.size
    title = breads_f[index]
    photo_url = breads_fpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "Piece(s)",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: false,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end


 shop_id = Shop.all.last.id - 1
 shop = Shop.find(shop_id)
 product_type = "Christmas"
 for index in 0 ... christmas_t.size
    title = christmas_f[index]
    photo_url = christmas_fpic[index].to_s
    p product_type
    p title
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..12).to_a.sample
 discount = [0.5, 0.55, 0.65, 0.75, 0.85, 0.82, 0.90]
 discount2 = discount[rand(0..6)]
 price_after_promotion_per_unit = initial_price_per_unit*discount2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: "piece",
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (3600..260000).to_a.sample,
 promotion_status: false,
 digits_code: 2432,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: 1,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
 end
