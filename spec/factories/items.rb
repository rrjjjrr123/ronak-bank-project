FactoryGirl.define do
  factory :item do |f|
    f.title     { "This is a title" }
    f.description  { "This is a description"  }
    f.price { "100" }
    f.seller_id { 5 }
  end
end



