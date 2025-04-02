User.destroy_all
Profile.destroy_all
Experience.destroy_all
Booking.destroy_all
Review.destroy_all


puts "Creating Users"
user1 = User.create!(email: "mary@gmail.com", password: "password")
user2 = User.create!(email: "john@gmail.com", password: "password")

puts "Creating Cities"
paris = City.create!(name: "Paris, France")
paris.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/paris.jpg")), filename: "paris.jpg", content_type: "image/jpg")

london = City.create!(name: "London, England")
london.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/london.jpg")), filename: "london.jpg", content_type: "image/jpg")

new_york = City.create!(name: "New York, USA")
new_york.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/new_york.jpg")), filename: "new_york.jpg", content_type: "image/jpg")

tokyo = City.create!(name: "Tokyo, Japan")
tokyo.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/tokyo.jpg")), filename: "tokyo.jpg", content_type: "image/jpg")

sydney = City.create!(name: "Sydney, Australia")
sydney.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/sydney.jpg")), filename: "sydney.jpg", content_type: "image/jpg")

puts "Creating Profiles"
local_profile = Profile.create!(name: "Mary Poppins", mode: "local", current_city: paris, original_city: paris, user: user1)
visitor_profile = Profile.create!(name: "John Doe", mode: "visitor", current_city: paris, original_city: london, user: user2)

local_profile.avatar.attach(io: File.open(Rails.root.join("app/assets/images/seeds/users/user-1.jpg")), filename: "user-1.jpg", content_type: "image/jpg")
visitor_profile.avatar.attach(io: File.open(Rails.root.join("app/assets/images/seeds/users/user-2.jpg")), filename: "user-2.jpg", content_type: "image/jpg")

puts "Creating Experiences"
experience1 = Experience.create!(name: "Croissant workshop", description: "Explore the best local croissant", city: paris, price: 50.00, duration: 4, profile: local_profile)
experience2 = Experience.create!(name: "Seine River Picnic", description: "Enjoy a picnic along the Seine River with wine tasting.", city: paris, price: 80.00, duration: 2, profile: local_profile)
experience3 = Experience.create!(name: "Latin Quarter - Rue Mouffetard", description: "Explore rue de Mouffetard of the Latin quarter by night", city: paris, price: 40.00, duration: 2, profile: local_profile)
experience4 = Experience.create!(name: "Explore Paris Specialty Cafe", description: "Enjoy local roasted coffee", city: paris, price: 25.00, duration: 3, profile: local_profile)
experience5 = Experience.create!(name: "Walking the paths of Monet", description: "Explore the walking paths of Monet", city: paris, price: 35.00, duration: 4, profile: local_profile)
experience6 = Experience.create!(name: "Explore the best bookstores", description: "Explore vintage bookstores in Paris", city: paris, price: 25.00, duration: 3, profile: local_profile)

experience1.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/experiences/croissants.jpg")), filename: "croissants.jpg", content_type: "image/jpg")
experience2.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/experiences/picnic.jpg")), filename: "picnic.jpg", content_type: "image/jpg")
experience3.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/experiences/rue.jpg")), filename: "rue.jpg", content_type: "image/jpg")
experience4.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/experiences/coffee.jpg")), filename: "coffee.jpg", content_type: "image/jpg")
experience5.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/experiences/monet.jpg")), filename: "monet.jpg", content_type: "image/jpg")
experience6.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/experiences/bookstore.jpg")), filename: "bookstore.jpg", content_type: "image/jpg")

puts "Creating a Booking"
booking1 = Booking.create!(date: DateTime.now, experience: experience1, profile: visitor_profile)
booking2 = Booking.create!(date: 2.weeks.ago, experience: experience3, profile: visitor_profile)
booking3 = Booking.create!(date: 1.month.ago, experience: experience5, profile: visitor_profile)
booking4 = Booking.create!(date: 1.week.from_now.to_date, experience: experience6, profile: visitor_profile)

puts "Creating a Review"
review1 = Review.create!(content: "Amazing experience!", booking: booking1)

puts "Creating Trips"
trip1 = Trip.create!(profile: visitor_profile, city: paris)
trip3 = Trip.create!(profile: visitor_profile, city: new_york)
trip4 = Trip.create!(profile: visitor_profile, city: tokyo)
trip5 = Trip.create!(profile: visitor_profile, city: sydney)


# # Creating Friendships
# Friendship.create!(profile_id_one: profile1.id, profile_id_two: profile2.id)
