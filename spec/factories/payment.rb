FactoryBot.define do
  factory :payment do
    association :movie, strategy: :create
    association :user, strategy: :create
    api_response_code   { 200 }
  end
end
