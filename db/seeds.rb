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
  ListingType.create( title: title, description: description )
end
