FactoryBot.define do
  factory :movie do
    title    { Faker::Movie.title }
    year     { Faker::Number.between(from: 1960, to: Date.current.year) }
    genre    { Faker::Lorem.word }
    plot     { Faker::Lorem.paragraph }
    country  { Faker::Address.country }
  end
end
