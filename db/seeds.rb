# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dogs = Topic.find_or_create_by!(title: 'Dogs')
cats = Topic.find_or_create_by!(title: 'Cats')

play_fight = Bookmark.create!(topic: dogs, url: 'http://imgur.com/gallery/Zq1vE27')
sick_cat   = Bookmark.create!(topic: cats, url: 'http://imgur.com/gallery/P3K8Z')
