# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all

3.times do |c|
	d = Category.create(name: "category #{c}")
	d.products.build(name: "product #{c}", price: 1000*c).save
	Product.create(name: "product #{c}", price: 1000*c, category_id: d.id)
end

Product.last.destroy
p = Product.last
p.premium = true
p.save

d = Category.all
d.each do |c|
	c.name.upcase!
	c.save
end