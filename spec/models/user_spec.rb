require 'rails_helper'
RSpec.describe User, :type => :model do
subject { described_class.new(first_name: "some", last_name: "john") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
 
    it "is not valid without an last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end  
end
