require 'rails_helper'
RSpec.describe Item, :type => :model do

  
  describe "Associations" do
    it "has many orders" do
      assc = described_class.reflect_on_association(:orders)
      expect(assc.macro).to eq :has_many
    end
  end

  seller = Seller.create!(full_name: "paras", email: "seller1111@gmail.com", password:"test123" ,password_confirmation:"test123")
  subject { described_class.new(price: 100 , seller_id: seller.id) }
  
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid with characters" do
      subject.price = "abcd"
      expect(subject).to_not be_valid
    end
  end  
end
