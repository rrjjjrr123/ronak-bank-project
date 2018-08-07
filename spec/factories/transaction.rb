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
    credit_acc {"3918180463"}
    debit_acc{"3918180463"}
    order_id { FactoryBot.generate(:order_rank) }
    bank_account_id{ 1 }
  end
end
