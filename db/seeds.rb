UserEvent.destroy_all
Event.destroy_all
User.destroy_all

organizer = User.create!(
  name: "Jamie Organizer",
  phone: "+1 555 010 1234",
  email: "organizer@example.com",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  name: "Alex Attendee",
  phone: "+1 555 010 5678",
  email: "attendee@example.com",
  password: "password123",
  password_confirmation: "password123"
)

events = [
  {
    name: "Rails Girls Berlin Workshop",
    description: "A free, friendly workshop introducing women to the world of programming through Ruby on Rails. No experience needed — just curiosity!",
    location: "Berlin, Germany",
    started_at: 12.days.from_now.change(hour: 9),
    ended_at: 12.days.from_now.change(hour: 16),
    category: "Workshop",
    price: 0,
    image_url: "https://images.unsplash.com/photo-1515169067868-5387ec356754?w=800&q=80"
  },
  {
    name: "Indie Music Night",
    description: "An intimate evening of live acoustic sets from up-and-coming indie artists. Grab a drink, relax, and discover your next favorite band.",
    location: "Austin, TX",
    started_at: 20.days.from_now.change(hour: 19),
    ended_at: 20.days.from_now.change(hour: 23),
    category: "Music",
    price: 25,
    image_url: "https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800&q=80"
  },
  {
    name: "Startup Pitch Night",
    description: "Watch five early-stage startups pitch to a panel of investors, followed by networking drinks for founders and angels.",
    location: "San Francisco, CA",
    started_at: 6.days.from_now.change(hour: 18, min: 30),
    ended_at: 6.days.from_now.change(hour: 21),
    category: "Business",
    price: 15,
    image_url: "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=800&q=80"
  },
  {
    name: "Sunrise Yoga in the Park",
    description: "Start your weekend with a gentle, all-levels yoga flow as the sun comes up. Mats provided, just bring water and good vibes.",
    location: "Portland, OR",
    started_at: 9.days.from_now.change(hour: 7),
    ended_at: 9.days.from_now.change(hour: 8),
    category: "Health",
    price: 0,
    image_url: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=800&q=80"
  },
  {
    name: "Street Food Festival",
    description: "Over 40 food trucks and local vendors serving up dishes from around the world. Live music and family-friendly activities all day.",
    location: "Brooklyn, NY",
    started_at: 15.days.from_now.change(hour: 11),
    ended_at: 15.days.from_now.change(hour: 20),
    category: "Food & Drink",
    price: 10,
    image_url: "https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&q=80"
  },
  {
    name: "React & Rails Full-Stack Meetup",
    description: "Monthly meetup for full-stack developers. This month: building real-time features with Hotwire vs. React — talks and open discussion.",
    location: "Remote (Online)",
    started_at: 3.days.from_now.change(hour: 17),
    ended_at: 3.days.from_now.change(hour: 19),
    category: "Tech",
    price: 0,
    image_url: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800&q=80"
  }
]

events.each do |attrs|
  event = Event.create!(attrs)
  UserEvent.create!(user: organizer, event: event, is_organizer: "true")
end

puts "Seeded #{User.count} users and #{Event.count} events."
puts "Log in as organizer@example.com / password123 or attendee@example.com / password123."
