Event.destroy_all
User.destroy_all

organizer = User.create!(
  name: "Jamie Organizer",
  email_address: "organizer@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :organizer
)

User.create!(
  name: "Alex Attendee",
  email_address: "attendee@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :attendee
)

events = [
  {
    title: "Rails Girls Berlin Workshop",
    description: "A free, friendly workshop introducing women to the world of programming through Ruby on Rails. No experience needed — just curiosity!",
    location: "Berlin, Germany",
    starts_at: 12.days.from_now.change(hour: 9),
    category: "Workshop",
    price: 0,
    image_url: "https://images.unsplash.com/photo-1515169067868-5387ec356754?w=800&q=80"
  },
  {
    title: "Indie Music Night",
    description: "An intimate evening of live acoustic sets from up-and-coming indie artists. Grab a drink, relax, and discover your next favorite band.",
    location: "Austin, TX",
    starts_at: 20.days.from_now.change(hour: 19),
    category: "Music",
    price: 25,
    image_url: "https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800&q=80"
  },
  {
    title: "Startup Pitch Night",
    description: "Watch five early-stage startups pitch to a panel of investors, followed by networking drinks for founders and angels.",
    location: "San Francisco, CA",
    starts_at: 6.days.from_now.change(hour: 18, min: 30),
    category: "Business",
    price: 15,
    image_url: "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=800&q=80"
  },
  {
    title: "Sunrise Yoga in the Park",
    description: "Start your weekend with a gentle, all-levels yoga flow as the sun comes up. Mats provided, just bring water and good vibes.",
    location: "Portland, OR",
    starts_at: 9.days.from_now.change(hour: 7),
    category: "Health",
    price: 0,
    image_url: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=800&q=80"
  },
  {
    title: "Street Food Festival",
    description: "Over 40 food trucks and local vendors serving up dishes from around the world. Live music and family-friendly activities all day.",
    location: "Brooklyn, NY",
    starts_at: 15.days.from_now.change(hour: 11),
    category: "Food & Drink",
    price: 10,
    image_url: "https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&q=80"
  },
  {
    title: "React & Rails Full-Stack Meetup",
    description: "Monthly meetup for full-stack developers. This month: building real-time features with Hotwire vs. React — talks and open discussion.",
    location: "Remote (Online)",
    starts_at: 3.days.from_now.change(hour: 17),
    category: "Tech",
    price: 0,
    image_url: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800&q=80"
  }
]

events.each { |attrs| organizer.events.create!(attrs) }

puts "Seeded #{User.count} users and #{Event.count} events."
puts "Log in as organizer@example.com / password123 (organizer) or attendee@example.com / password123 (attendee)."
