Line.delete_all

Line.create!(color: 'red', direction: 'inbound')
Line.create!(color: 'red', direction: 'outbound')
Line.create!(color: 'green', direction: 'inbound')
Line.create!(color: 'green', direction: 'outbound')
Line.create!(color: 'blue', direction: 'inbound')
Line.create!(color: 'blue', direction: 'outbound')
Line.create!(color: 'orange', direction: 'inbound')
Line.create!(color: 'orange', direction: 'outbound')
Line.create!(color: 'silver', direction: 'inbound')
Line.create!(color: 'silver', direction: 'outbound')

User.create!(username: 'csadusky', password_digest: 'holly1810')
User.create!(username: 'jalmeida', password_digest:'josh1234')

rline = Line.first
court = User.first
josh = User.second

rline.comments.create!(user: court, post:"redline is all backed up, should have walked")
rline.comments.create!(user: josh, post:"walk with if you can")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
