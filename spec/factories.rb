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
    price 10
    capacity 10
    name{|e| e.city }
    description{ Faker::Company.catch_phrase }
    schedule{ Faker::Lorem.paragraphs }
    registration_email{ Faker::Lorem.paragraphs }
    reminder_email{ Faker::Lorem.paragraphs }
  end

  factory :registration do
    association :event
    first_name{ Faker::Name.first_name }
    last_name{ Faker::Name.last_name }
    email{|r| Faker::Internet.free_email("#{r.first_name} #{r.last_name}") }
    shirt_size{ Registration::SHIRT_SIZES.sample }
  end

  factory :twitter_registration, parent: :registration do
    twitter_handle{|r| Faker::Internet.user_name("#{r.first_name} #{r.last_name}") }
    twitter_token do
      id    = SecureRandom.random_number(1_000_000_000)
      token = SecureRandom.urlsafe_base64(40).tr("_-", "").slice(0..40)
      "#{id}-#{token}"
    end
  end
end
