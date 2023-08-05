require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    it 'checks if is valid' do
      expect(user1.valid?).to eq(true)
    end

    it 'checks email presence' do
      user1.email = nil
      expect(user1.valid?).to eq(false)
    end

    it 'checks email uniqueness with case sensitive' do
      user2.email = user1.email.upcase
      expect(user2.valid?).to eq(false)
    end

    it 'checks password presence' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end
  end
end
