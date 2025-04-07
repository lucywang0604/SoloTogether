User.destroy_all
Profile.destroy_all
Experience.destroy_all
Booking.destroy_all
Review.destroy_all
City.destroy_all


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


puts "Creating Users"
# Create users with realistic names and emails
# Prepare user and profile data
user_profile_data = [
  {
    user: { email: "lucy@gmail.com", password: "password" },
    profile: { name: "Lucy Wang", image_url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "john@gmail.com", password: "password" },
    profile: { name: "John Doe", image_url: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "jane@gmail.com", password: "password" },
    profile: { name: "Jane Doe", image_url: "https://images.unsplash.com/photo-1534528741775-53994a69daeb", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "mike@gmail.com", password: "password" },
    profile: { name: "Mike Doe", image_url: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d", current_city: paris, original_city: paris, mode: "local" }
  },
  {
    user: { email: "emma.thompson@gmail.com", password: "password" },
    profile: { name: "Emma Thompson", image_url: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "l.martinez83@gmail.com", password: "password" },
    profile: { name: "Lucas Martinez", image_url: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "sofia.chen@gmail.com", password: "password" },
    profile: { name: "Sofia Chen", image_url: "https://images.unsplash.com/photo-1517841905240-472988babdf9", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "alex.wright@gmail.com", password: "password" },
    profile: { name: "Alexander Wright", image_url: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "bella.santos@gmail.com", password: "password" },
    profile: { name: "Isabella Santos", image_url: "https://images.unsplash.com/photo-1544005313-94ddf0286df2", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "ethan.p@gmail.com", password: "password" },
    profile: { name: "Ethan Patel", image_url: "https://images.unsplash.com/photo-1519345182560-3f2917c472ef", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "olivia.kim92@gmail.com", password: "password" },
    profile: { name: "Olivia Kim", image_url: "https://images.unsplash.com/photo-1531123897727-8f129e1688ce", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "will.anderson@gmail.com", password: "password" },
    profile: { name: "William Anderson", image_url: "https://images.unsplash.com/photo-1463453091185-61582044d556", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "ava.rodriguez@gmail.com", password: "password" },
    profile: { name: "Ava Rodriguez", image_url: "https://images.unsplash.com/photo-1557296387-5358ad7997bb", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "noah.c@gmail.com", password: "password" },
    profile: { name: "Noah Campbell", image_url: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "s.nguyen@gmail.com", password: "password" },
    profile: { name: "Sophia Nguyen", image_url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "james.oconnor@gmail.com", password: "password" },
    profile: { name: "James O'Connor", image_url: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "mia.garcia@gmail.com", password: "password" },
    profile: { name: "Mia Garcia", image_url: "https://images.unsplash.com/photo-1534528741775-53994a69daeb", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "ben.lee@gmail.com", password: "password" },
    profile: { name: "Benjamin Lee", image_url: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e", current_city: london, original_city: paris, mode: "local" }
  },
  {
    user: { email: "char.wilson@gmail.com", password: "password" },
    profile: { name: "Charlotte Wilson", image_url: "https://images.unsplash.com/photo-1517841905240-472988babdf9", current_city: paris, original_city: tokyo, mode: "visitor" }
  },
  {
    user: { email: "d.cohen@gmail.com", password: "password" },
    profile: { name: "Daniel Cohen", image_url: "https://images.unsplash.com/photo-1463453091185-61582044d556", current_city: london, original_city: paris, mode: "local" }
  }
]

# Create users and profiles
users = user_profile_data.map do |data|
  user = User.create!(data[:user])
  profile = Profile.create!(
    name: data[:profile][:name],
    mode: data[:profile][:mode],
    current_city: data[:profile][:current_city],
    original_city: data[:profile][:original_city],
    user: user
  )

  # Attach avatar from URL
  begin
    profile.avatar.attach(
      io: URI.open(data[:profile][:image_url]),
      filename: "avatar-#{user_profile_data.index(data)}.jpg",
      content_type: "image/jpeg"
    )
  rescue OpenURI::HTTPError => e
    puts "Failed to attach avatar for #{profile.name}: #{e.message}"
  end

  user
end

puts "Creating Experiences"
experience_data = [
  {
    name: "Authentic French Pastry Workshop",
    description: "Learn to make croissants and pain au chocolat with a professional pastry chef in a cozy Parisian kitchen",
    city: paris,
    price: 85.00,
    duration: 3,
    profile: Profile.find_by(name: "Mike Doe"),
    image_url: "https://images.unsplash.com/photo-1549903072-7e6e0bedb7fb"
  },
  {
    name: "Hidden Montmartre Art Tour",
    description: "Explore the artistic soul of Montmartre, visiting local artists' studios and secret spots",
    city: paris,
    price: 45.00,
    duration: 2,
    profile: Profile.find_by(name: "John Doe"),
    image_url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34"
  },
  {
    name: "Le Marais Food Journey",
    description: "Taste your way through historic Le Marais district, sampling local delicacies",
    city: paris,
    price: 65.00,
    duration: 3,
    profile: Profile.find_by(name: "Jane Doe"),
    image_url: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0"
  },
  {
    name: "Seine Sunset Photography",
    description: "Capture the magic of Paris at sunset with a professional photographer",
    city: paris,
    price: 55.00,
    duration: 2,
    profile: Profile.find_by(name: "Mike Doe"),
    image_url: "https://images.unsplash.com/photo-1499856871958-5b9627545d1a"
  },
  {
    name: "Vintage Shopping in Le Marais",
    description: "Discover hidden vintage treasures in Paris's most fashionable district",
    city: paris,
    price: 40.00,
    duration: 3,
    profile: Profile.find_by(name: "John Doe"),
    image_url: "https://images.unsplash.com/photo-1489987707025-afc232f7ea0f"
  },
  {
    name: "Camden Market Explorer",
    description: "Experience London's vibrant Camden Market with a local guide",
    city: london,
    price: 35.00,
    duration: 3,
    profile: Profile.find_by(name: "John Doe"),
    image_url: "https://images.unsplash.com/photo-1533900298318-6b8da08a523e"
  }
]

experiences = experience_data.map do |data|
  experience = Experience.new(
    name: data[:name],
    description: data[:description],
    city: data[:city],
    price: data[:price],
    duration: data[:duration],
    profile: data[:profile]
  )

  begin
    experience.photo.attach(
      io: URI.open(data[:image_url]),
      filename: "#{data[:name].parameterize}.jpg",
      content_type: "image/jpeg"
    )
  rescue OpenURI::HTTPError => e
    puts "Failed to attach photo for #{data[:name]}: #{e.message}"
  end

  experience.save!
  experience
end

puts "Creating a Booking"
booking1 = Booking.create!(date: DateTime.now, experience: Experience.find_by(name: "Authentic French Pastry Workshop"), profile: Profile.find_by(name: "Lucy Wang"))
booking2 = Booking.create!(date: 2.weeks.ago, experience: Experience.find_by(name: "Hidden Montmartre Art Tour"), profile: Profile.find_by(name: "Lucy Wang"))
booking3 = Booking.create!(date: 1.month.ago, experience: Experience.find_by(name: "Le Marais Food Journey"), profile: Profile.find_by(name: "Lucy Wang"))
booking4 = Booking.create!(date: 1.week.from_now.to_date, experience: Experience.find_by(name: "Vintage Shopping in Le Marais"), profile: Profile.find_by(name: "Lucy Wang"))

puts "Creating a Review"
review1 = Review.create!(content: "Amazing experience!", booking: booking1)

puts "Creating Trips"
trip1 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: paris)
trip3 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: new_york)
trip4 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: tokyo)
trip5 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: sydney)


# # Creating Friendships
# Friendship.create!(profile_id_one: profile1.id, profile_id_two: profile2.id)
