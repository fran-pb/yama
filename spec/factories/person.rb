FactoryBot.define do
  factory :person, aliases: [:character, :director, :producer] do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
  end
end
