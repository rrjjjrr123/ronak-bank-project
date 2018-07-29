FactoryBot.define do
  
  sequence(:ranking_otp) do |n|
    @order_rankings ||= (1..10).to_a.shuffle
    @order_rankings[n]
  end

  factory :otp do 
    id { FactoryBot.generate(:ranking_otp) }
    otp { SecureRandom.hex(6)}
 
  end
end
