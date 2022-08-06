# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Post.destroy_all
Booking.destroy_all
HelpRequest.destroy_all
Review.destroy_all
Message.destroy_all
Participant.destroy_all
User.destroy_all

User.create(email: "chichi@gmail.com", password: "123456", username: "Chix2", first_name: "ChiChi", last_name: "L", phone_number: "0431 000 000", address: "79 Bridge Road, Richmond Victoria 3121, Australia")
User.create(email: "alex@gmail.com", password: "123456", username: "Alex", first_name: "Alex", last_name: "Borro", phone_number: "0431 000 004", address: "12 River St, Richmond VIC 3121")
User.create(email: "fran@gmail.com", password: "123456", username: "Fran", first_name:"Fran", last_name: "M", phone_number: "0431 000 002", address: "649 Bridge Rd, Richmond VIC 3121")
User.create(email: "anuth@gmail.com", password: "123456", username: "Anuth", first_name: "Anuth", last_name: "H", phone_number: "0431 000 003", address: "619 Church St, Richmond VIC 3121")
User.create(email: "manon@gmail.com", password: "123456", username: "Manon", first_name: "Manon", last_name: "S", phone_number: "0431 000 003", address: "300 Church St, Richmond VIC 3121")

Post.create(category: "product", title: "camping gear", description: "1 x 4 people tent and 2 x chairs. I bought over Christmas, in very good conditon", location: "157 Swan St, Richmond VIC 3121", duration: 3, user_id:1)
Post.create(category: "product", title: "Tennis racquets", description: "I've got a couple of spare racquets that happy to lend to my neiboughers. Condition is fair and do the job 100%", location: "40 Clifton St, Richmond, VIC, 3121", duration: 2, user_id:3)

Booking.create(user_id: "5", post_id: "1", start_time: "17/08/2022 8:00:00", end_time: "18/08/2022 20:00:00", status: "confirmed", message: "May I borrow this for my trip, I'll retrun them in the same condition :) Thanks!")
Booking.create(user_id: "4", post_id: "2", start_time: "01/08/2022 8:00:00", end_time: "02/08/2022 10:00:00", status: "confirmed", message: "May I borrow your tennis racquets for a game? Sorry for the last minute notice, Thanks very much!")
Booking.create(user_id: "2", post_id: "1", start_time: "01/08/2022 8:00:00", end_time: "02/08/2022 20:00:00", status: "confirmed", message: "I've booked this camping trip to suprise my partner, but not sure if she will like it. So may I borrow your gears to try it out? Thanks very much! I can help you to some gardening work as exchange.")

HelpRequest.create(category: "service", title:"play cards",description:"looking to find a card budy to kill some afternoons together.", location:"2 Elm Grove, Richmond, 3121", duration: "1",user_id:"2")

Review.create(booking_id: 3, rating: 5, comment: "A very freiendly lady, and gear is in great condition!")
