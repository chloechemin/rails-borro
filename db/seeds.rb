# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'
# Faker::Name.name      #=> "Christophe Bartell"
# Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

User.create(email: "chichi@gmail.com", password: "123456", username: "Chix2", first_name: "ChiChi", last_name: "LUAN", phone_number: "0431 000 000", address: "79 Bridge Road, Richmond Victoria 3121, Australia")
User.create(email: "chloe@gmail.com", password: "123456", username: "Chloe", first_name: "Chloe", last_name: "Chemin", phone_number: "0431 000 001", address: "41 Stewart St, Richmond VIC 3121")
User.create(email: "fran@gmail.com", password: "123456", username: "Fran", first_name:"Fran", last_name: "Montecinos", phone_number: "0431 000 002", address: "649 Bridge Rd, Richmond VIC 3121")
User.create(email: "anuth@gmail.com", password: "123456", username: "Anuth", first_name: "Anuth", last_name: "Hatharasinghe", phone_number: "0431 000 003", address: "619 Church St, Richmond VIC 3121")
User.create(email: "alex@gmail.com", password: "123456", username: "Alex", first_name: "Alex", last_name: "Borro", phone_number: "0431 000 004", address: "12 River St, Richmond VIC 3121")

Post.create(category: "product", title:"camping gear", description:"bought over christmas, in very good conditon", location: "157 Swan St, Richmond VIC 3121", duration: 3, user_id:1)
Post.create(category: "product", title:"disney DVDs", description:"watched too many times and need a break from them", location: "80 North St, Richmond VIC 3121", duration: 5, user_id:1)
Post.create(category: "service", title:"gardening", description:"happy to help my elderly neighbours to do a bit gardening works ", location: "79 Bridge Rd, Richmond VIC 3181", duration: 1, user_id:1)
Post.create(category: "service", title:"baby sitting", description:"need a break from your kids for an hour? I got you!", location: "406 Bridge Rd, Richmond VIC 3121", duration: 1, user_id:1)
Post.create(category: "product", title:"lawn mower", description:"Happy to share my lawn mower, if you can do mine too :)", location: "41 Stewart St, Richmond VIC 3121", duration: 2, user_id:2)
Post.create(category: "service", title:"water garden", description:"I'll water your garden professionally", location: "160 Simpson St, East Melbourne VIC 3002", duration: 3, user_id:2)
Post.create(category: "product", title:"tennis rackets", description:"good pair of tennis rackets, just too big for my ping pong", location: "545 Church St, Richmond VIC 3121", duration: 10, user_id:3)
Post.create(category: "service", title:"grocery shopping", description:"neighbours only, once a day, I'lll keep the change.", location: "649 Bridge Rd, Richmond VIC 3121", duration: 1, user_id:3)
Post.create(category: "product", title:"portable BBQ", description:"great for picnic, please return as new", location: "12 River St, Richmond VIC 3121", duration: 4, user_id: 4)
Post.create(category: "service", title:"dog walker", description:"I think I love dogs, but my cat doesn't know yet", location: "79 Bridge Road, Richmond Victoria 3121, Australia", duration: 1, user_id:4)

Booking.create(user_id: 1, post_id: 5, status: "Not confirmed", start_time: "14 Jul 2022 00:00:00", end_time:"15 Jan 2022 00:00:00")
Booking.create(user_id: 1, post_id: 7, status: "Confirmed", start_time: "01 Aug 2022 04:11:00", end_time:"03 Aug 2022 04:11:00")
Booking.create(user_id: 2, post_id: 1, status: "Confirmed", start_time: "30 Jul 2022 04:11:00", end_time:"01 Aug 2022 04:11:00")
Booking.create(user_id: 2, post_id: 9, status: "Not confirmed", start_time: "04 Aug 2022 04:11:00", end_time:"06 Aug 2022 04:11:00")
Booking.create(user_id: 3, post_id: 2, status: "Confirmed", start_time: "20 Jul 2022 04:11:00", end_time:"21 Jul 2022 04:11:00")
Booking.create(user_id: 4, post_id: 8, status: "Confirmed", start_time: "02 Aug 2022 04:11:00", end_time:"02 Aug 2022 04:11:00")

Chatroom.create(name: "chatroom 1")
Chatroom.create(name: "chatroom 2")

Message.create(chatroom_id: 1, content: "how are you?", user_id: 1)
Message.create(chatroom_id: 1, content: "I'm good thanks", user_id: 3)
Message.create(chatroom_id: 1, content: "Do you teach tennis too?", user_id: 1)
Message.create(chatroom_id: 1, content: "Nah, only watch...", user_id: 3)

Message.create(chatroom_id: 2, content: "Comment ça va?", user_id: 2)
Message.create(chatroom_id: 2, content: "Je vais bien merci", user_id: 4)
Message.create(chatroom_id: 2, content: "aimez-vous cuisiner au barbecue?", user_id: 2)
Message.create(chatroom_id: 2, content: "Je ne sais pas cuisiner, mais je peux manger", user_id: 4)

Participant.create(chatroom_id: 1, user_id: 1)
Participant.create(chatroom_id: 1, user_id: 3)
Participant.create(chatroom_id: 2, user_id: 2)
Participant.create(chatroom_id: 2, user_id: 4)

Review.create(booking_id: 2, rating: 5, comment: "very, will use it again")
Review.create(booking_id: 3, rating: 2, comment: "Not too sure... ")
Review.create(booking_id: 5, rating: 4.5, comment: "really good quality")
Review.create(booking_id: 6, rating: 5, comment: "the lender is very friendly")
