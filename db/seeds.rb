# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

User.create(email: "chichi@gmail.com", password: "123456", username: "ChiChi", first_name: "ChiChi", last_name: "L", phone_number: "0431 000 000", address: "79 Bridge Road, Richmond Victoria 3121, Australia")
User.create(email: "marco@gmail.com", password: "123456", username: "Marco", first_name: "Marco", last_name: "Borro", phone_number: "0431 000 004", address: "12 River St, Richmond VIC 3121")
User.create(email: "fran@gmail.com", password: "123456", username: "Fran", first_name:"Fran", last_name: "M", phone_number: "0431 000 002", address: "649 Bridge Rd, Richmond VIC 3121")
User.create(email: "anuth@gmail.com", password: "123456", username: "Anuth", first_name: "Anuth", last_name: "H", phone_number: "0431 000 003", address: "619 Church St, Richmond VIC 3121")
User.create(email: "manon@gmail.com", password: "123456", username: "Manon", first_name: "Manon", last_name: "S", phone_number: "0431 000 003", address: "250 Church St, Richmond VIC 3121")
User.create(email: "tom@gmail.com", password: "123456", username: "Tom", first_name: "Tom", last_name: "I", phone_number: "0431 000 003", address: "100 Church St, Richmond VIC 3121")
User.create(email: "peter@gmail.com", password: "123456", username: "Peter", first_name: "Peter", last_name: "P", phone_number: "0431 000 003", address: "566 Bridge Rd, Richmond VIC 3121")
User.create(email: "tony@gmail.com", password: "123456", username: "Tony", first_name: "Lucy", last_name: "S", phone_number: "0431 000 003", address: "4 Lord St, Richmond VIC 3121")
User.create(email: "lucy@gmail.com", password: "123456", username: "Lucy", first_name: "Lucy", last_name: "W", phone_number: "0431 000 003", address: "208 Lennox St, Richmond VIC 3121")
User.create(email: "amy@gmail.com", password: "123456", username: "Amy", first_name: "Amy", last_name: "T", phone_number: "0431 000 003", address: "326 Church St, Richmond VIC 3121")
User.create(email: "lord@gmail.com", password: "123456", username: "Lord", first_name: "Lord", last_name: "S", phone_number: "0431 000 003", address: "326 Bridge Rd, Richmond VIC 3121")
User.create(email: "mark@gmail.com", password: "123456", username: "Mark", first_name: "Mark", last_name: "B", phone_number: "0431 000 003", address: "10 Lord St, Richmond VIC 3121")




Post.create(category: "product", title:"camping gear", description:"1 x 4 men tent and 2 x chairs. I bought over Christmas, in very good conditon", location: "157 Swan St, Richmond VIC 3121", duration: 3, user_id:1)
Post.create(category: "product", title:"Tennis racquets", description:"I've got a couple of spare racquets that happy to lend to my neiboughers. Condition is fair and do the job 100%", location: "619 Church St, Richmond VIC 3121", duration: 2, user_id:4)
Post.create(category: "product", title:"camping chair", description:"A couple of spare chairs. Happy to lend to my neighbour ", location: "100 Church St, Richmond VIC 3121", duration: 3, user_id:6)
Post.create(category: "product", title:"camping tent", description:"Got a tent,  happy to lend to my neighbour ", location: "566 Bridge Rd, Richmond VIC 3121", duration: 3, user_id:7)
Post.create(category: "product", title:"camping table", description:"We bought this table for camping but too small for us. Happy to lend to my neighbour ", location: "4 Lord St, Richmond VIC 3121", duration: 5, user_id:8)








Booking.create(user_id: 4, post_id: 1, start_time:"01 Aug 2022 8:00:00", end_time:"02 Aug 2022 20:00:00", status:"Confirmed", message:"I've booked this camping trip to suprise my partner, but not sure if she will like it. So may I borrow your gears to try it out? Thanks very much! I can help you to some gardening work as exchange.")
Booking.create(user_id:3, post_id:2, start_time:"01 Aug 2022 8:00:00", end_time:"02 Aug 2022 10:00:00",status:"Confirmed", message:"May I borrow your tennis racquets for a game? Sorry for the last minute notice, Thanks very much!")
Booking.create(user_id: 5, post_id: 1, status: "Confirmed", start_time: "08 Aug 2022 10:00:00", end_time:"10 Aug 2022 14:00:00",message:"May I borrow this for my trip, I'll retrun them in the same condition :) Thanks!")
Booking.create(user_id: 9, post_id: 1, status: "Confirmed", start_time: "27 Jul 2022 10:00:00", end_time:"29 Jul 2022 14:00:00",message:"Please lend to me, Thanks!")
Booking.create(user_id: 10, post_id: 1, status: "Confirmed", start_time: "15 Jul 2022 10:00:00", end_time:"16 Jul 2022 14:00:00",message:"May I borrow this for my trip, I'll retrun them in the same condition :) Thanks!")
Booking.create(user_id: 11, post_id: 1, status: "Confirmed", start_time: " 15 Aug 2022 10:00:00", end_time:"16 Aug 2022 14:00:00",message:"May I borrow this for my trip, I'll retrun them in the same condition :) Thanks!")
Booking.create(user_id: 12, post_id: 1, status: "Confirmed", start_time: " 20 Aug 2022 10:00:00", end_time:"23 Aug 2022 14:00:00",message:"May I borrow this for my trip, I'll retrun them in the same condition :) Thanks!")
Booking.create(user_id: 9, post_id:2, start_time:"17 Jul 2022 8:00:00", end_time:"18 Jul 2022 10:00:00",status:"Confirmed", message:"Hoping to borrow it for a couple of days, thank you!")



HelpRequest.create(category:"service",title:"Dog walker",description:"looking to find someone to walk my lovely dog a couple times day, while i'm in hospital for a surgey. He is a friendly Corgi and gets well with everyone.",location:"2 Elm Grove, Richmond, 3121",duration:"0.2",user_id:"2")
HelpRequest.create(category:"service",title:"Gardening work",description:"I'm in my 90s, and need a bit help with my garden. ", location:"12 Lord St, Richmond VIC 3121",duration:"0.2",user_id:"12")
HelpRequest.create(category:"service",title:"Grocery shopping", description:" We are old couples and need help with our weekly grocery shopping.", location:"326 Bridge Rd, Richmond VIC 3121",duration:"0.2",user_id:"11")
HelpRequest.create(category:"product",title:"Wheel barrow",description:"Does anyone have a wheel barrow can lend to me for a weekend or two? Need to clear out some soil from the garden.", location:"10 Lord St, Richmond VIC 3121",duration:"2",user_id:"10")
HelpRequest.create(category:"product",title:"ladder",description:"I need to borrow a 8 step ladder. ", location:"208 Lennox St, Richmond VIC 3121",duration:"0.5",user_id:"9")






Review.create(booking_id: 1, rating: 5, comment: "A very friendly lady, and gear is in great condition!")
Review.create(booking_id: 4, rating: 5, comment: "This was awesome, perfect condition. Thanks!")
Review.create(booking_id: 5, rating: 5, comment: "Great person and very reliable. Thanks!")
Review.create(booking_id: 8, rating: 5, comment: "Awesome racquet! Good man!")
