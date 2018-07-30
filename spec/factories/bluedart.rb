FactoryBot.define do
    
  sequence(:random_bluedart) do |n|
    @random_rankings ||= (100..100000).to_a.shuffle
    @random_rankings[n]
  end

  factory :bluedart do 
    email { Faker::Internet.email }
    id { FactoryBot.generate(:random_bluedart) }
  end
end
