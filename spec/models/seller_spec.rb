require 'rails_helper'
RSpec.describe Seller, type: :model do
  describe 'Associations' do
    it 'has many items' do
      assc = described_class.reflect_on_association(:items)
      expect(assc.macro).to eq :has_many
    end
  end
end
