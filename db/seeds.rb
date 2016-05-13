# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

User.create(first_name: 'Sean', last_name: 'Van Houten', email: 'seanv@gmail.com', current_city: 'Oakland', image: 'http://wisemansay.co.uk/wp-content/uploads/2010/09/Celebrity-Image-Simpsons-Bart-Simpson-72600.jpg', password: "123456", current_employer: "google", seeking_work: true, tech_preference: "javascript")
User.create(first_name: 'Neil', last_name: 'Patrick', email: 'neil@gmail.com', current_city: 'San Francisco', image: 'http://images6.fanpop.com/image/photos/33100000/simosons-the-simpsons-33176742-250-250.jpg', password: "123456", current_employer: "facebook", seeking_work: false, tech_preference: "ruby")
User.create(first_name: 'Sarah', last_name: 'McInrow', email: 'donm@gmail.com', current_city: 'San Francisco', image: 'http://www.simpsoncrazy.com/content/characters/marge.gif', password: "123456", current_employer: "instagram", seeking_work: true, tech_preference: "php")
User.create(first_name: 'Sharon', last_name: 'Williams', email: 'kansas@gmail.com', current_city: 'Milbrae', image: 'http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=17986400', password: "123456", current_employer: "linkedin", seeking_work: false, tech_preference: "python")
User.create(first_name: 'Remy', last_name: 'Gleason', email: 'remy@gmail.com', current_city: 'San Jose', image: 'http://www.simpsoncrazy.com/content/characters/cbg.gif', password: "123456", current_employer: "oracle", seeking_work: true, tech_preference: "javascript")
User.create(first_name: 'Sebastian', last_name: 'Ringwald', email: 'sebas@gmail.com', current_city: 'Pleasanton', image: 'http://www.simpsoncrazy.com/content/characters/abe.gif', password: "123456", current_employer: "general assembly", seeking_work: true, tech_preference: "binary")
