require 'rails_helper'
RSpec.describe BankAccount, type: :model do
  describe 'Associations' do
    it 'has many transactions' do
      assc = described_class.reflect_on_association(:transactions)
      expect(assc.macro).to eq :has_many
    end
  end
end
