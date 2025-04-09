User.destroy_all
Profile.destroy_all
Experience.destroy_all
Booking.destroy_all
Review.destroy_all
City.destroy_all


puts "Creating Cities"
paris = City.create!(name: "Paris, France")
paris.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/paris.jpg")), filename: "paris.jpg", content_type: "image/jpg")

taipei = City.create!(name: "Taipei, Taiwan")
taipei.photo.attach(io: File.open(Rails.root.join("app/assets/images/seeds/cities/taipei.jpg")), filename: "taipei.jpg", content_type: "image/jpg")

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
    profile: { name: "Lucy Wang", image_url: "https://avatars.githubusercontent.com/u/182869529", current_city: paris, original_city: taipei, mode: "visitor", birthdate: Date.new(1985, 10, 20), spoken_languages: ["French", "English", "Mandarin"], sex: "female", biography: "Food enthusiast and travel photographer exploring Europe one city at a time. Always on the hunt for hidden gems and local experiences." }
  },
  {
    user: { email: "ivy@gmail.com", password: "password" },
    profile: { name: "Ivy Chiang", image_url: "https://avatars.githubusercontent.com/u/182496547?v=4", current_city: paris, original_city: taipei, mode: "local", birthdate: Date.new(1997, 06, 24), spoken_languages: ["Mandarin", "English"], sex: "female", biography: "Born and raised in Taipei, now showing visitors the real London. History buff and amateur street photographer." }
  },
  {
    user: { email: "tina@gmail.com", password: "password" },
    profile: { name: "Tina Lee", image_url: "https://avatars.githubusercontent.com/u/182520498?v=4", current_city: paris, original_city: taipei, mode: "local", birthdate: Date.new(1996, 05, 01), spoken_languages: ["English", "Mandarin"], sex: "female", biography: "Digital nomad and culture enthusiast. Love meeting new people and experiencing different ways of life." }
  },
  {
    user: { email: "mike@gmail.com", password: "password" },
    profile: { name: "Mike Doe", image_url: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d", current_city: paris, original_city: taipei, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "French"], sex: "male", biography: "Professional chef and culinary tour guide. Passionate about sharing authentic French cuisine and cooking techniques." }
  },
  {
    user: { email: "emma.thompson@gmail.com", password: "password" },
    profile: { name: "Emma Thompson", image_url: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English"], sex: "female", biography: "Art historian and museum enthusiast. Currently researching European art movements while exploring Paris's galleries." }
  },
  {
    user: { email: "l.martinez83@gmail.com", password: "password" },
    profile: { name: "Lucas Martinez", image_url: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Spanish"], sex: "male", biography: "Music producer and nightlife connoisseur. Know all the best underground venues and emerging artists in London." }
  },
  {
    user: { email: "sofia.chen@gmail.com", password: "password" },
    profile: { name: "Sofia Chen", image_url: "https://images.unsplash.com/photo-1517841905240-472988babdf9", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Mandarin"], sex: "female", biography: "Fashion design student exploring European style. Love vintage shopping and discovering upcoming designers." }
  },
  {
    user: { email: "alex.wright@gmail.com", password: "password" },
    profile: { name: "Alexander Wright", image_url: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English"], sex: "male", biography: "Architecture tour guide specializing in London's hidden historical gems. Tea enthusiast and amateur historian." }
  },
  {
    user: { email: "bella.santos@gmail.com", password: "password" },
    profile: { name: "Isabella Santos", image_url: "https://images.unsplash.com/photo-1544005313-94ddf0286df2", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Portuguese"], sex: "female", biography: "Dance instructor and cultural events organizer. Love bringing people together through music and movement." }
  },
  {
    user: { email: "ethan.p@gmail.com", password: "password" },
    profile: { name: "Ethan Patel", image_url: "https://images.unsplash.com/photo-1519345182560-3f2917c472ef", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Hindi"], sex: "male", biography: "Tech startup founder and foodie. Can recommend the best curry houses and innovative restaurants in London." }
  },
  {
    user: { email: "olivia.kim92@gmail.com", password: "password" },
    profile: { name: "Olivia Kim", image_url: "https://images.unsplash.com/photo-1531123897727-8f129e1688ce", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Korean"], sex: "female", biography: "Travel writer and photographer. Documenting the intersection of traditional and modern culture in European cities." }
  },
  {
    user: { email: "will.anderson@gmail.com", password: "password" },
    profile: { name: "William Anderson", image_url: "https://images.unsplash.com/photo-1463453091185-61582044d556", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English"], sex: "male", biography: "Craft beer enthusiast and pub crawl guide. Expert in London's historic pubs and local brewing scene." }
  },
  {
    user: { email: "ava.rodriguez@gmail.com", password: "password" },
    profile: { name: "Ava Rodriguez", image_url: "https://images.unsplash.com/photo-1557296387-5358ad7997bb", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Spanish"], sex: "female", biography: "Yoga instructor and wellness advocate. Seeking peaceful spots and healthy living inspiration in urban environments." }
  },
  {
    user: { email: "noah.c@gmail.com", password: "password" },
    profile: { name: "Noah Campbell", image_url: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English"], sex: "male", biography: "Street art curator and urban culture guide. Know all the best spots for graffiti and contemporary art installations." }
  },
  {
    user: { email: "s.nguyen@gmail.com", password: "password" },
    profile: { name: "Sophia Nguyen", image_url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Vietnamese"], sex: "female", biography: "Literature lover and bookstore explorer. Always searching for cozy reading spots and literary history." }
  },
  {
    user: { email: "james.oconnor@gmail.com", password: "password" },
    profile: { name: "James O'Connor", image_url: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English"], sex: "male", biography: "Football fanatic and sports bar connoisseur. Expert in finding the best spots to watch matches and meet fellow fans." }
  },
  {
    user: { email: "mia.garcia@gmail.com", password: "password" },
    profile: { name: "Mia Garcia", image_url: "https://images.unsplash.com/photo-1534528741775-53994a69daeb", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Spanish"], sex: "female", biography: "Film student and cinema enthusiast. Love discovering independent movie theaters and film festivals." }
  },
  {
    user: { email: "ben.lee@gmail.com", password: "password" },
    profile: { name: "Benjamin Lee", image_url: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Korean"], sex: "male", biography: "Jazz musician and live music aficionado. Know all the best venues for live performances in London." }
  },
  {
    user: { email: "char.wilson@gmail.com", password: "password" },
    profile: { name: "Charlotte Wilson", image_url: "https://images.unsplash.com/photo-1517841905240-472988babdf9", current_city: paris, original_city: tokyo, mode: "visitor", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English"], sex: "female", biography: "Garden designer and nature lover. Exploring urban green spaces and hidden gardens in European cities." }
  },
  {
    user: { email: "d.cohen@gmail.com", password: "password" },
    profile: { name: "Daniel Cohen", image_url: "https://images.unsplash.com/photo-1463453091185-61582044d556", current_city: london, original_city: paris, mode: "local", birthdate: (rand(18..60).years.ago + rand(1..12).months), spoken_languages: ["English", "Hebrew"], sex: "male", biography: "Food market expert and cooking class host. Passionate about connecting people through culinary experiences." }
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
    sex: data[:profile][:sex],
    spoken_languages: data[:profile][:spoken_languages],
    birthdate: data[:profile][:birthdate],
    biography: data[:profile][:biography],
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
    profile: Profile.find_by(name: "Ivy Chiang"),
    image_url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34"
  },
  {
    name: "Le Marais Food Journey",
    description: "Taste your way through historic Le Marais district, sampling local delicacies",
    city: paris,
    price: 65.00,
    duration: 3,
    profile: Profile.find_by(name: "Tina Lee"),
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
    profile: Profile.find_by(name: "Ivy Chiang"),
    image_url: "https://images.unsplash.com/photo-1489987707025-afc232f7ea0f"
  },
  {
    name: "Camden Market Explorer",
    description: "Experience London's vibrant Camden Market with a local guide",
    city: london,
    price: 35.00,
    duration: 3,
    profile: Profile.find_by(name: "Lucy Wang"),
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

# puts "Creating a Review"
# review1 = Review.create!(content: "Amazing experience!", booking: booking1)

puts "Creating Trips"
# Lucy Wang's trips
trip1 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: paris)
trip2 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: new_york)
trip3 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: tokyo)
trip4 = Trip.create!(profile: Profile.find_by(name: "Lucy Wang"), city: sydney)

# Ivy Chiang's trips
trip5 = Trip.create!(profile: Profile.find_by(name: "Ivy Chiang"), city: london)
trip6 = Trip.create!(profile: Profile.find_by(name: "Ivy Chiang"), city: taipei)
trip7 = Trip.create!(profile: Profile.find_by(name: "Ivy Chiang"), city: tokyo)

# Tina Lee's trips
trip8 = Trip.create!(profile: Profile.find_by(name: "Tina Lee"), city: sydney)
trip9 = Trip.create!(profile: Profile.find_by(name: "Tina Lee"), city: new_york)
trip10 = Trip.create!(profile: Profile.find_by(name: "Tina Lee"), city: london)

# Mike Doe's trips
trip11 = Trip.create!(profile: Profile.find_by(name: "Mike Doe"), city: paris)
trip12 = Trip.create!(profile: Profile.find_by(name: "Mike Doe"), city: tokyo)
trip13 = Trip.create!(profile: Profile.find_by(name: "Mike Doe"), city: london)

# Emma Thompson's trips
trip14 = Trip.create!(profile: Profile.find_by(name: "Emma Thompson"), city: new_york)
trip15 = Trip.create!(profile: Profile.find_by(name: "Emma Thompson"), city: sydney)
trip16 = Trip.create!(profile: Profile.find_by(name: "Emma Thompson"), city: paris)

# Lucas Martinez's trips
trip17 = Trip.create!(profile: Profile.find_by(name: "Lucas Martinez"), city: tokyo)
trip18 = Trip.create!(profile: Profile.find_by(name: "Lucas Martinez"), city: london)
trip19 = Trip.create!(profile: Profile.find_by(name: "Lucas Martinez"), city: new_york)

# Sofia Chen's trips
trip20 = Trip.create!(profile: Profile.find_by(name: "Sofia Chen"), city: sydney)
trip21 = Trip.create!(profile: Profile.find_by(name: "Sofia Chen"), city: paris)
trip22 = Trip.create!(profile: Profile.find_by(name: "Sofia Chen"), city: tokyo)

# Alexander Wright's trips
trip23 = Trip.create!(profile: Profile.find_by(name: "Alexander Wright"), city: london)
trip24 = Trip.create!(profile: Profile.find_by(name: "Alexander Wright"), city: new_york)
trip25 = Trip.create!(profile: Profile.find_by(name: "Alexander Wright"), city: sydney)

# Isabella Santos's trips
trip26 = Trip.create!(profile: Profile.find_by(name: "Isabella Santos"), city: paris)
trip27 = Trip.create!(profile: Profile.find_by(name: "Isabella Santos"), city: tokyo)
trip28 = Trip.create!(profile: Profile.find_by(name: "Isabella Santos"), city: london)

# Ethan Patel's trips
trip29 = Trip.create!(profile: Profile.find_by(name: "Ethan Patel"), city: new_york)
trip30 = Trip.create!(profile: Profile.find_by(name: "Ethan Patel"), city: sydney)
trip31 = Trip.create!(profile: Profile.find_by(name: "Ethan Patel"), city: paris)

# Olivia Kim's trips
trip32 = Trip.create!(profile: Profile.find_by(name: "Olivia Kim"), city: paris)
trip33 = Trip.create!(profile: Profile.find_by(name: "Olivia Kim"), city: london)
trip34 = Trip.create!(profile: Profile.find_by(name: "Olivia Kim"), city: tokyo)

# William Anderson's trips
trip35 = Trip.create!(profile: Profile.find_by(name: "William Anderson"), city: london)
trip36 = Trip.create!(profile: Profile.find_by(name: "William Anderson"), city: paris)
trip37 = Trip.create!(profile: Profile.find_by(name: "William Anderson"), city: new_york)

# Ava Rodriguez's trips
trip38 = Trip.create!(profile: Profile.find_by(name: "Ava Rodriguez"), city: paris)
trip39 = Trip.create!(profile: Profile.find_by(name: "Ava Rodriguez"), city: tokyo)
trip40 = Trip.create!(profile: Profile.find_by(name: "Ava Rodriguez"), city: sydney)

# Noah Campbell's trips
trip41 = Trip.create!(profile: Profile.find_by(name: "Noah Campbell"), city: london)
trip42 = Trip.create!(profile: Profile.find_by(name: "Noah Campbell"), city: new_york)
trip43 = Trip.create!(profile: Profile.find_by(name: "Noah Campbell"), city: paris)

# Sophia Nguyen's trips
trip44 = Trip.create!(profile: Profile.find_by(name: "Sophia Nguyen"), city: paris)
trip45 = Trip.create!(profile: Profile.find_by(name: "Sophia Nguyen"), city: london)
trip46 = Trip.create!(profile: Profile.find_by(name: "Sophia Nguyen"), city: sydney)

# James O'Connor's trips
trip47 = Trip.create!(profile: Profile.find_by(name: "James O'Connor"), city: london)
trip48 = Trip.create!(profile: Profile.find_by(name: "James O'Connor"), city: tokyo)
trip49 = Trip.create!(profile: Profile.find_by(name: "James O'Connor"), city: new_york)

# Mia Garcia's trips
trip50 = Trip.create!(profile: Profile.find_by(name: "Mia Garcia"), city: paris)
trip51 = Trip.create!(profile: Profile.find_by(name: "Mia Garcia"), city: tokyo)
trip52 = Trip.create!(profile: Profile.find_by(name: "Mia Garcia"), city: london)

# Benjamin Lee's trips
trip53 = Trip.create!(profile: Profile.find_by(name: "Benjamin Lee"), city: london)
trip54 = Trip.create!(profile: Profile.find_by(name: "Benjamin Lee"), city: paris)
trip55 = Trip.create!(profile: Profile.find_by(name: "Benjamin Lee"), city: sydney)

# Charlotte Wilson's trips
trip56 = Trip.create!(profile: Profile.find_by(name: "Charlotte Wilson"), city: paris)
trip57 = Trip.create!(profile: Profile.find_by(name: "Charlotte Wilson"), city: new_york)
trip58 = Trip.create!(profile: Profile.find_by(name: "Charlotte Wilson"), city: tokyo)

# Daniel Cohen's trips
trip59 = Trip.create!(profile: Profile.find_by(name: "Daniel Cohen"), city: london)
trip60 = Trip.create!(profile: Profile.find_by(name: "Daniel Cohen"), city: sydney)
trip61 = Trip.create!(profile: Profile.find_by(name: "Daniel Cohen"), city: paris)

# Creating Friendships
puts "Creating Friendships"

# Create some specific friendships to ensure good connectivity
# Lucy's core friend group
[
  ["Lucy Wang", "Emma Thompson"],
  ["Lucy Wang", "Sofia Chen"],
  ["Lucy Wang", "Olivia Kim"],

  # John's core friend group
  ["Ivy Chiang", "Lucas Martinez"],
  ["Ivy Chiang", "Alexander Wright"],
  ["Ivy Chiang", "William Anderson"],

  # Cross-group connections
  ["Emma Thompson", "Ivy Chiang"],
  ["Sofia Chen", "Lucas Martinez"],
  ["Olivia Kim", "Alexander Wright"],

  # International connections
  ["Isabella Santos", "Ethan Patel"],
  ["Ava Rodriguez", "Noah Campbell"],
  ["Sophia Nguyen", "James O'Connor"],
  ["Mia Garcia", "Benjamin Lee"],
  ["Charlotte Wilson", "Daniel Cohen"]
].each do |name1, name2|
  profile1 = Profile.find_by(name: name1)
  profile2 = Profile.find_by(name: name2)

  # Create single friendship
  Friendship.create!(profile: profile1, friend: profile2)
end

# Creating Bookings
puts "Creating Bookings"

# Get all experiences
experiences = Experience.all

# Create bookings for each profile
Profile.all.each do |profile|
  # Each profile will have 1-3 bookings
  num_bookings = rand(1..3)

  # Get random experiences for this profile
  profile_experiences = experiences.sample(num_bookings)

  profile_experiences.each do |experience|
    # Randomly decide if it's a past or future booking
    is_past = rand(2) == 0

    if is_past
      # Create a past booking (1 week to 6 months ago)
      date = rand(1..180).days.ago
    else
      # Create a future booking (1 week to 3 months from now)
      date = rand(7..90).days.from_now
    end

    Booking.create!(
      date: date,
      experience: experience,
      profile: profile
    )
  end
end

# Create some specific bookings to ensure good coverage
# Lucy's bookings (already created, but adding more)
Booking.create!(
  date: 2.days.from_now,
  experience: Experience.find_by(name: "Authentic French Pastry Workshop"),
  profile: Profile.find_by(name: "Lucy Wang")
)

# Emma's bookings
Booking.create!(
  date: 2.weeks.from_now,
  experience: Experience.find_by(name: "Authentic French Pastry Workshop"),
  profile: Profile.find_by(name: "Emma Thompson")
)
Booking.create!(
  date: 1.month.ago,
  experience: Experience.find_by(name: "Hidden Montmartre Art Tour"),
  profile: Profile.find_by(name: "Emma Thompson")
)

# John's bookings
Booking.create!(
  date: 1.week.from_now,
  experience: Experience.find_by(name: "Le Marais Food Journey"),
  profile: Profile.find_by(name: "Ivy Chiang")
)
Booking.create!(
  date: 2.months.ago,
  experience: Experience.find_by(name: "Seine Sunset Photography"),
  profile: Profile.find_by(name: "Ivy Chiang")
)

# Sofia's bookings
Booking.create!(
  date: 3.weeks.from_now,
  experience: Experience.find_by(name: "Vintage Shopping in Le Marais"),
  profile: Profile.find_by(name: "Sofia Chen")
)
Booking.create!(
  date: 1.week.ago,
  experience: Experience.find_by(name: "Camden Market Explorer"),
  profile: Profile.find_by(name: "Sofia Chen")
)

# Alexander's bookings
Booking.create!(
  date: 2.weeks.from_now,
  experience: Experience.find_by(name: "Authentic French Pastry Workshop"),
  profile: Profile.find_by(name: "Alexander Wright")
)

# Isabella's bookings
Booking.create!(
  date: 1.month.from_now,
  experience: Experience.find_by(name: "Hidden Montmartre Art Tour"),
  profile: Profile.find_by(name: "Isabella Santos")
)
Booking.create!(
  date: 2.weeks.ago,
  experience: Experience.find_by(name: "Le Marais Food Journey"),
  profile: Profile.find_by(name: "Isabella Santos")
)

# Ethan's bookings
Booking.create!(
  date: 3.weeks.from_now,
  experience: Experience.find_by(name: "Seine Sunset Photography"),
  profile: Profile.find_by(name: "Ethan Patel")
)

# Olivia's bookings
Booking.create!(
  date: 1.week.from_now,
  experience: Experience.find_by(name: "Vintage Shopping in Le Marais"),
  profile: Profile.find_by(name: "Olivia Kim")
)
Booking.create!(
  date: 1.month.ago,
  experience: Experience.find_by(name: "Camden Market Explorer"),
  profile: Profile.find_by(name: "Olivia Kim")
)

# William's bookings
Booking.create!(
  date: 2.weeks.from_now,
  experience: Experience.find_by(name: "Authentic French Pastry Workshop"),
  profile: Profile.find_by(name: "William Anderson")
)

# Ava's bookings
Booking.create!(
  date: 1.month.from_now,
  experience: Experience.find_by(name: "Hidden Montmartre Art Tour"),
  profile: Profile.find_by(name: "Ava Rodriguez")
)

# Noah's bookings
Booking.create!(
  date: 3.weeks.from_now,
  experience: Experience.find_by(name: "Le Marais Food Journey"),
  profile: Profile.find_by(name: "Noah Campbell")
)
Booking.create!(
  date: 2.weeks.ago,
  experience: Experience.find_by(name: "Seine Sunset Photography"),
  profile: Profile.find_by(name: "Noah Campbell")
)

# Sophia's bookings
Booking.create!(
  date: 1.week.from_now,
  experience: Experience.find_by(name: "Vintage Shopping in Le Marais"),
  profile: Profile.find_by(name: "Sophia Nguyen")
)

# James's bookings
Booking.create!(
  date: 2.weeks.from_now,
  experience: Experience.find_by(name: "Camden Market Explorer"),
  profile: Profile.find_by(name: "James O'Connor")
)
Booking.create!(
  date: 1.month.ago,
  experience: Experience.find_by(name: "Authentic French Pastry Workshop"),
  profile: Profile.find_by(name: "James O'Connor")
)

# Mia's bookings
Booking.create!(
  date: 3.weeks.from_now,
  experience: Experience.find_by(name: "Hidden Montmartre Art Tour"),
  profile: Profile.find_by(name: "Mia Garcia")
)

# Benjamin's bookings
Booking.create!(
  date: 1.week.from_now,
  experience: Experience.find_by(name: "Le Marais Food Journey"),
  profile: Profile.find_by(name: "Benjamin Lee")
)
Booking.create!(
  date: 2.weeks.ago,
  experience: Experience.find_by(name: "Seine Sunset Photography"),
  profile: Profile.find_by(name: "Benjamin Lee")
)

# Charlotte's bookings
Booking.create!(
  date: 2.weeks.from_now,
  experience: Experience.find_by(name: "Vintage Shopping in Le Marais"),
  profile: Profile.find_by(name: "Charlotte Wilson")
)

# Daniel's bookings
Booking.create!(
  date: 1.month.from_now,
  experience: Experience.find_by(name: "Camden Market Explorer"),
  profile: Profile.find_by(name: "Daniel Cohen")
)
Booking.create!(
  date: 3.weeks.ago,
  experience: Experience.find_by(name: "Authentic French Pastry Workshop"),
  profile: Profile.find_by(name: "Daniel Cohen")
)
