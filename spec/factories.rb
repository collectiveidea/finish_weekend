FactoryGirl.define do
  factory :event do
    host{ Faker::Company.name }
    venue{|e| e.host }
    address{ Faker::Address.street_address(rand(2) == 1) }
    city{ Faker::Address.city }
    state{ Faker::Address.state }
    country "United States"
    starts_at{ Time.zone.parse("Saturday") + 4.weeks + 8.hours }
    ends_at{|e| e.starts_at + 32.hours }
    price{ rand(3..6) * 10 }
    capacity{ rand(2..10) * 10 }
    name{|e| e.city }
    description{ Faker::Company.catch_phrase }
    schedule{ Faker::Lorem.paragraphs }
    registration_email{ Faker::Lorem.paragraphs }
    reminder_email{ Faker::Lorem.paragraphs }
  end
end
