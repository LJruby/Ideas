# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.destroy_all
Status.create(name: 'Under review')
Status.create(name: 'Planned')
Status.create(name: 'Completed')
Status.create(name: 'Declined')

Category.destroy_all
Category.create(name: 'Idea')
Category.create(name: 'Question')
Category.create(name: 'Bug')
Category.create(name: 'Thank you')
