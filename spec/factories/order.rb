FactoryBot.define do
  sequence(:order_ranking) do |n|
    @order_rankings ||= (100..100_000).to_a.shuffle
    @order_rankings[n]
  end

  sequence(:amount_ranking) do |n|
    @amount_rankings ||= (500_0..100_00).to_a.shuffle
    @amount_rankings[n]
  end

  sequence(:user_ranking) do |n|
    @user_rankings ||= (1..500).to_a.shuffle
    @user_rankings[n]
  end

  sequence(:item_ranking) do |n|
    @item_rankings ||= (30..200).to_a.shuffle
    @item_rankings[n]
  end

  factory :order do
    amount { FactoryBot.generate(:amount_ranking) }
    id { FactoryBot.generate(:order_ranking) }
    user_id { FactoryBot.generate(:user_ranking) }
    item_id { FactoryBot.generate(:item_ranking) }
  end
end
