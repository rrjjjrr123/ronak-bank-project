FactoryBot.define do
  sequence(:ranking_item) do |n|
    @order_rankings ||= (100_0..100_000).to_a.shuffle
    @order_rankings[n]
  end

  sequence(:ranking_quantity) do |n|
    @order_rankings ||= (100_0..100_000).to_a.shuffle
    @order_rankings[n]
  end

  factory :item do |f|
    f.title { 'This is a title' }
    f.description { 'This is a description' }
    f.price { '100' }
    seller_id { '5' }
    id { FactoryBot.generate(:ranking_item) }
    quantity { FactoryBot.generate(:ranking_quantity) }
  end

  factory :invalid_item, parent: :item do |f|
    f.title { 'This is a title' }
    f.description { 'This is a description' }
    f.price { '100' }
    seller_id { 'abcd' }
    id { FactoryBot.generate(:ranking_item) }
  end
end
