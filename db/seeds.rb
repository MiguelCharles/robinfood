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

Shop.create(user_id: User.all.first.id, name_of_the_store: "Exki", photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/XVvCWFEQSg_nN3ISlYGlQw/348s.jpg", category:"Grand Place", description: "Cuisiner des produits de saison, valoriser les végétaux, donner la préférence aux agriculteurs respectueux de la planès", phone_number: "+32 479 22 55 66", VAT_number: "ABCD", country:"Belgium", city:"Brussels", zip_code: 1000, address:"
Rue du Marché aux Herbes", street_number: 93)
Shop.create(user_id: User.all.last.id, name_of_the_store: "Chez Marcel", photo_url: "http://www.elle.be/fr/wp-content/uploads/2016/08/marcel.jpg", category:"Fine Grocery", description: "Votre boulanger de tradition qui aime le gout", phone_number:"+32 56 33 23 47" ,VAT_number: "AZERTY", country:"Belgium", city:"Ixelles", zip_code: 1050, address:"Avenue Louise", street_number: 200)


ingredients = ["Fruit", "Vegetable", "Bread", "Christmas"]

fruits = ["Jonnagold Apple", "Orange from Valencia", "Belgian Pear Doyen", "Strawberry from Wepion"]
fruits_pic = ["https://s3-eu-west-1.amazonaws.com/mijntuin/plants/23996.jpg",
"http://lespetitsplatsdemireille.hautetfort.com/images/orange.png",
"https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/11/06/17/pears3.jpg",
"http://i.ndtvimg.com/i/2015-11/strawberry-625_625x350_81447914865.jpg"
]


vegetables = ["Cabbages", "Celery", "Zuchini", "Spinach", "Sweet Potato"]
vegetables_pic = [
"http://previews.123rf.com/images/egal/egal1301/egal130100042/17543705-Assortment-of-fresh-cabbages-isolated-on-white-background-Stock-Photo.jpg",
"https://draxe.com/wp-content/uploads/2015/04/bigstock-Fresh-green-celery-isolated-on-52080031.jpg",
"http://i.ndtvimg.com/mt/cooks/2014-11/courgettes-zucchini.jpg",
"http://www.naturalineco.com/kindeditor/attached/image/20140926/20140926231629_9834.png",
"http://sheismynutritionist.com/wp-content/uploads/2013/09/sweet-potato-nutritional-fact-versus-regular-potato.png"
]

breads = ["Cougnou", "Cramique", "Croissant", "Baguette"]
breads_pic = [
"http://www.orpea.be/upload/news/850/cougnou.jpg",
"http://www.labonnecuisine.be/wp-content/uploads/2015/11/cramique-2.jpg",
"http://labadiane-hanoi.com/wp-content/uploads/2014/08/la-badiane-lich-su-banh-sung-bo.jpg",
"ttp://painrisien.com/wp-content/uploads/2012/05/DSC03319.jpg"]

sandwich = ["John", "Luca", "Louisa", "Big Poulet", "Marcos", "DeliEggs"]
sandwich_pic = 'http://storage.canalblog.com/65/66/128490/55125607_p.jpg'

christmas = ["cupcake", "chocolate cake", "chutney", "gingerbread"]
christmas_pic = ["https://s-media-cache-ak0.pinimg.com/originals/87/e3/49/87e34981af6005a516af6ce14bfa3f4f.jpg",
  "https://s-media-cache-ak0.pinimg.com/564x/7b/7b/bc/7b7bbcd25f417d511e01c6f63f6b4fd1.jpg",
  "http://www.lipglossiping.com/wp-content/uploads/2012/10/christmas-chutney-finished2.jpg",
  "http://thecookieshop.files.wordpress.com/2009/11/gingerbread.jpg"
]


20.times do
 unit1 = ["Kg","piece(s)"]
 unit2 = unit1[rand(0..1)]
 shop_id = Shop.all.sample.id
 shop = Shop.find(shop_id)
 if shop.name_of_the_store == "Exki"
    product_type = "Sandwich"
    title = sandwich.sample
    photo_url = sandwich_pic
 else
   product_type = ingredients.sample
   if product_type == "Fruit"
      i = rand(0..3)
      title = fruits[i]
      photo_url = fruits_pic[i]
    elsif product_type == "Vegetable"
      title = vegetables.sample
      i = rand(0..4)
      title = vegetables[i]
      photo_url = vegetables_pic[i]
    elsif product_type == "Bread"
      i = rand(0..3)
      title = breads[i]
      photo_url = breads_pic[i]
    else product_type == "Christmas"
      i = rand(0..3)
      title = christmas[i]
      photo_url = christmas_pic[i]
  end
 end
 initial_quantity = (1..15).to_a.sample
 initial_price_per_unit = (5..40).to_a.sample
 price_after_promotion_per_unit = initial_price_per_unit/2
 Promotion.create(shop_id: shop_id,
 title: title,
 product_type: product_type,
 initial_quantity: [10, 20, 30, 40, 50, 60].sample,
 remaining_quantity: (initial_quantity - (0...initial_quantity).to_a.sample),
 unit: unit2,
 photo_url: photo_url,
 description: "#{product_type} - #{title}",
 validity: Time.now + (10..50).to_a.sample,
 promotion_status: true,
 digits_code: (1000..9999).to_a.sample,
 initial_price_per_unit: initial_price_per_unit,
 min_quantity: (1..10).to_a.sample,
 price_after_promotion_per_unit:price_after_promotion_per_unit)
end
