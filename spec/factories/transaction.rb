FactoryBot.define do
  
  sequence(:ranking_transaction) do |n|
    @order_rankings ||= (1..10).to_a.shuffle
    @order_rankings[n]
  end

  factory :transaction do |f| 
    id { FactoryBot.generate(:ranking_transaction) }
    credit_bank_account{"9835597191"}
    debit_bank_account{"9835597191"}
  end
end
