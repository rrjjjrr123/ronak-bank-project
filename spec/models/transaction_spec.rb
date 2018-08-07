require 'rails_helper'
RSpec.describe Transaction, type: :model do
  describe 'Associations' do
    it 'has one otp' do
      assc = described_class.reflect_on_association(:otp)
      expect(assc.macro).to eq :has_one
    end
  end
end
