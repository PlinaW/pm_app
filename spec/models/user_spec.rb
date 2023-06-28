require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }

    it 'checks if is valid' do
      expect(user.valid?).to eq(true)
    end

    it 'checks email presence' do
      user.email = nil
      expect(user.valid?).to eq(false)
    end

    it 'checks email uniqueness with case sensitive' do
      user = create(:user)
      user.email = 'test@example.com'
      user2 = User.new(first_name: 'test2',
                       last_name: 'test2',
                       password: '1234',
                       email: 'TEST@example.com')
      expect(user2.valid?).to eq(false)
    end

    it 'checks password presence' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end
  end
end
