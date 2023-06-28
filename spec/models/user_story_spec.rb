require 'rails_helper'

RSpec.describe UserStory, type: :model do
  describe 'validations' do
    let(:user_story) { create(:user_story) }
    let(:epic) { create(:epic) }

    it 'checks if UserStory is valid' do
      expect(user_story.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      user_story2 = UserStory.new
      user_story2.name = user_story.name
      expect(user_story2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another epic' do
      epic2 = create(:epic)
      UserStory.create(name: 'test name', epic:)
      user_story2 = UserStory.create(name: 'test name', epic: epic2)
      expect(user_story2.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same epic' do
      UserStory.create(name: 'test name', epic:, priority: 1)
      user_story2 = UserStory.create(name: 'test name2', epic:, priority: 1)
      expect(user_story2.valid?).to eq(false)
    end

    it 'checks if UserStory can have the same priority in another Epic' do
      epic2 = create(:epic)
      UserStory.create(name: 'test name', epic:, priority: 1)
      user_story2 = UserStory.create(name: 'test name2', epic: epic2, priority: 1)
      expect(user_story2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      user_story.priority = nil
      expect(user_story.valid?).to eq(true)
    end
  end
end
