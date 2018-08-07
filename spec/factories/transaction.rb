FactoryBot.define do
  sequence(:ranking_transaction) do |n|
    @order_rankings ||= (1..10).to_a.shuffle
    @order_rankings[n]
  end

  sequence(:order_rank) do |n|
    @order_rankings ||= (1..10).to_a.shuffle
    @order_rankings[n]
  end

  factory :transaction do
    id { FactoryBot.generate(:ranking_transaction) }
  end
end
