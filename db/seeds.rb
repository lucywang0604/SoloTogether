User.destroy_all
Profile.destroy_all
Experience.destroy_all
Booking.destroy_all
Review.destroy_all


# Creating Users
user1 = User.create!(email: "local@gmail.com", password: "password")
user2 = User.create!(email: "visitor@gmail.com", password: "password")

user1.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/users/user-1.jpg")), filename: "user-1.jpg", content_type: "image/jpg")
user2.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/users/user-2.jpg")), filename: "user-2.jpg", content_type: "image/jpg")

# Creating Profiles
profile1 = Profile.create!(name: "Local One", mode: "local", current_city: "New York", original_city: "Paris", user: user1)
profile2 = Profile.create!(name: "Visitor One", mode: "visitor", current_city: "Paris", original_city: "London", user: user2)

# Creating Experiences
experience1 = Experience.create!(name: "Croissant workshop", description: "Explore the best local croissant", city: "Paris", latitude: 48.8566, longitude: 2.3522, price: 50.00, duration: 4, profile: profile1)
experience2 = Experience.create!(name: "Seine River Picnic", description: "Enjoy a picnic along the Seine River with wine tasting.", city: "Paris", latitude: 48.8566, longitude: 2.3522, price: 80.00, duration: 2, profile: profile1)

# Creating a Booking
booking1 = Booking.create!(date: DateTime.now, experience: experience1, profile: profile2)

# Creating a Review
review1 = Review.create!(content: "Amazing experience!", booking: booking1)

# # Creating Friendships
# Friendship.create!(profile_id_one: profile1.id, profile_id_two: profile2.id)
