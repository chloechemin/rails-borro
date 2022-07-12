# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'
# Faker::Name.name      #=> "Christophe Bartell"
# Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

Booking.create(user_id: 1, post_id: 1, status: "not confirmed")
Chatroom.create(name: "chatroom 1")
Message.create(chatroom_id: 1, content: "how are you?", user_id: 1)
Participant.create(chatroom_id: 1, user_id: 1)
Post.create(category: "product", title:"camping gear", description:"bought over christmas, in very good conditon", location:"Melbourne, 3000", duration: 3, user_id:2)
Review.create(booking_id: 1, rating: 4.5, comment: "really good quality, and the lender is very friendly")
User.create(email: "chichi@gmail.com", encrypted_password: "123456", username: "Chix2", first_name: "ChiChi", last_name: "LUAN", phone_number:"0431 000 000", address:"Melbourne, 3000")

# User.create(email: "cloe@gmail.com", password: "123456", username: "Cloe")
# User.create(email: "fran@gmail.com", password: "123456", username: "Fran")
# User.create(email: "anuth@gmail.com", password: "123456", username: "Anuth")
