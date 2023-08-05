require 'rails_helper'

RSpec.describe UserStory, type: :model do
  describe 'validations' do
    let(:epic1) { create(:epic) }
    let(:epic2) { create(:epic) }
    let(:user_story1) { create(:user_story, epic: epic1) }
    let(:user_story2) { create(:user_story, epic: epic1) }

    it 'checks if UserStory is valid' do
      expect(user_story1.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      user_story2.name = user_story1.name
      expect(user_story2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another epic' do
      user_story2.epic = epic2
      user_story2.name = user_story1.name
      expect(user_story2.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same epic' do
      user_story2.priority = user_story1.priority
      expect(user_story2.valid?).to eq(false)
    end

    it 'checks if UserStory can have the same priority in another Epic' do
      user_story2.epic = epic2
      user_story2.priority = user_story1.priority
      expect(user_story2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      user_story1.priority = nil
      expect(user_story1.valid?).to eq(true)
    end
  end
end
