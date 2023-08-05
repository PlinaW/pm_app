require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    let(:user_story1) { create(:user_story) }
    let(:user_story2) { create(:user_story) }
    let(:task1) { create(:task, user_story: user_story1, user: nil, sprint: nil) }
    let(:task2) { create(:task, user_story: user_story1, user: nil, sprint: nil) }

    it 'checks if Task is valid' do
      expect(task1.valid?).to eq(true)
    end

    it 'checks name uniqueness in the same UserStory' do
      task2.name = task1.name.upcase
      expect(task2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another UserStory' do
      task2.user_story = user_story2
      task2.name = task1.name
      expect(task2.valid?).to eq(true)
    end

    it 'checks if Task is valid without Sprint' do
      task1.sprint = nil
      expect(task1.valid?).to eq(true)
    end

    it 'checks if Task is valid without User' do
      task1.user = nil
      expect(task1.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same UserStory' do
      task2.priority = task1.priority
      expect(task2.valid?).to eq(false)
    end

    it 'checks if task can have the same priority in another UserStory' do
      task2.user_story = user_story2
      task2.priority = task1.priority
      expect(task2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      task1.priority = nil
      expect(task1.valid?).to eq(true)
    end

    it 'checks if starts_at is less than ends_at' do
      task1.starts_at = Date.tomorrow
      task1.ends_at = Date.yesterday
      expect(task1.valid?).to eq(false)
    end

    it 'checks if starts_at and ends_at can be empty' do
      task1.starts_at = nil
      task1.ends_at = nil
      expect(task1.valid?).to eq(true)
    end

    it 'checks if starts_at can be empty' do
      task1.starts_at = nil
      task1.ends_at = Date.today
      expect(task1.valid?).to eq(true)
    end

    it 'checks if ends_at can be empty' do
      task1.starts_at = Date.today
      task1.ends_at = nil
      expect(task1.valid?).to eq(true)
    end
  end
end
