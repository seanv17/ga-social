# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

user_1 = User.create(first_name: 'Sean', last_name: 'Van Houten', email: 'seanvanho@gmail.com', current_city: 'Oakland', avatar: 'http://wisemansay.co.uk/wp-content/uploads/2010/09/Celebrity-Image-Simpsons-Bart-Simpson-72600.jpg', password: "123456", current_employer: "Google", current_position: "unemployed", seeking_work: true, tech_preference: "javascript")
user_2 = User.create(first_name: 'Neil', last_name: 'Patrick', email: 'neil@gmail.com', current_city: 'San Francisco', avatar: 'http://images6.fanpop.com/image/photos/33100000/simosons-the-simpsons-33176742-250-250.jpg', password: "123456", current_employer: "Facebook", current_position: "student", seeking_work: false, tech_preference: "ruby")
user_3 = User.create(first_name: 'Sarah', last_name: 'McInrow', email: 'sarah@gmail.com', current_city: 'San Francisco', avatar: 'http://www.simpsoncrazy.com/content/characters/marge.gif', password: "123456", current_employer: "Instagram", current_position: "mooch", seeking_work: true, tech_preference: "php")
user_4 = User.create(first_name: 'Sharon', last_name: 'Williams', email: 'sharon@gmail.com', current_city: 'Milbrae', avatar: 'http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=17986400', password: "123456", current_employer: "Linkedin", current_position: "freelancer", seeking_work: false, tech_preference: "python")
user_5 = User.create(first_name: 'Remy', last_name: 'Gleason', email: 'remy@gmail.com', current_city: 'San Jose', avatar: 'http://www.simpsoncrazy.com/content/characters/cbg.gif', password: "123456", current_employer: "Oracle", current_position: "Co-Founder", seeking_work: true, tech_preference: "javascript")
user_6 = User.create(first_name: 'Sebastian', last_name: 'Ringwald', email: 'sebas@gmail.com', current_city: 'Pleasanton', avatar: 'http://www.simpsoncrazy.com/content/characters/abe.gif', password: "123456", current_employer: "General Assembly", current_position: "unemployed", seeking_work: true, tech_preference: "binary")

Post.destroy_all

Post.create(body: 'post 1 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_1.id)
Post.create(body: 'post 2 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_1.id)
Post.create(body: 'post 1 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_2.id)
Post.create(body: 'post 2 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_2.id)
Post.create(body: 'post 1 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_3.id)
Post.create(body: 'post 2 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_3.id)
Post.create(body: 'post 1 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_4.id)
Post.create(body: 'post 2 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_4.id)
Post.create(body: 'post 1 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_5.id)
Post.create(body: 'post 2 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_5.id)
Post.create(body: 'post 1 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_6.id)
Post.create(body: 'post 2 Lorem ipsum dolor sit amet, putent alienum sed no, cum cu natum sadipscing, tibique volutpat at pri. Sea cu malis volumus signiferumque. Ne vim tamquam fuisset, doctus audire urbanitas id mea. Nec ei verterem suavitate, quo eligendi lobortis no.', user_id: user_6.id)
