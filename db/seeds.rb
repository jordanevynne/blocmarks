# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food = Topic.find_or_create_by!(title: 'food')


burgers = Bookmark.create!(topic: food, url: 'https://s-media-cache-ak0.pinimg.com/736x/66/27/01/6627010d3fd8a0456df94237f49769e9.jpg')
