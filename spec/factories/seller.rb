FactoryGirl.define do
    
  sequence(:random_ranking) do |n|
    @random_rankings ||= (100..100000).to_a.shuffle
    @random_rankings[n]
  end

  factory :seller do 
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    id { FactoryGirl.generate(:random_ranking) }
  end
end
