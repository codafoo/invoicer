# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
consultants = Consultant.create([{name: 'Bob'}, {name: 'Sue'}, {name: 'John'}])
customers = Customer.create([{name: 'ACME'},{name: 'BigCorp'},{name: 'LilCorp'}])
