FactoryBot.define do
  sequence(:random) do |n|
    @random ||= (100..100_000).to_a.shuffle
    @random[n]
  end

  sequence(:uid_random) do |n|
    @random ||= (1..10).to_a.shuffle
    @random[n]
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    id { FactoryBot.generate(:random) }
    uid { FactoryBot.generate(:uid_random) }
    first_name { 'ronak' }
    last_name  { 'jain' }
  end
end
