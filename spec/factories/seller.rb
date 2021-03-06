FactoryBot.define do
  sequence(:random_ranking) do |n|
    @random_rankings ||= (100..100_000).to_a.shuffle
    @random_rankings[n]
  end

  factory :seller do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    id { FactoryBot.generate(:random_ranking) }
    user_type { 'seller' }
    full_name { 'sush' }
  end
end
