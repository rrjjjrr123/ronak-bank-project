FactoryBot.define do
    
  sequence(:random) do |n|
    @random ||= (100..100000).to_a.shuffle
    @random[n]
  end

  factory :user do 
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    id {FactoryBot.generate(:random) }
    first_name {"ronak"}
    last_name  {"jain"}
  end
end
