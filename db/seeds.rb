# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

listing_type_list = [
  [ "Single Desk", "Single Desk In Office" ],
  [ "Private Office", "Private office room" ],
  [ "Cubicle", "Desk in a cubicle" ],
  [ "Open Office", "This office is an open space and has room to accomodate more people" ]
]

listing_type_list.each do |title, description|
  unless ListingType.find_by(title: title)
    ListingType.create( title: title, description: description )
  end
end

amenities_list = [
  ["Pet Friendly", "We allow pets! (Check for restrictions)", "fa fa-paw"],
  ["Coffee", "Coffee Machine Available!", "fa fa-coffee"],
  ["WiFi", "Wireless Throughout the Office", "fa fa-wifi"],
  ["Beer!", "Beer in the Office!!", "fa fa-beer"],
  ["Snacks", "Snacks Available", "fa fa-cutlery"],
  ["Conference rooms", "Conference Rooms Available", "fa fa-slideshare"]

]

amenities_list.each do |title, description, logo|
  amen = Amenity.find_or_initialize_by( name: title, description: description, font_awesome_image: logo )
  amen.save
end
