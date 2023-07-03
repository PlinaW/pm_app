require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    let(:task) { create(:task) }
    let(:user_story) { create(:user_story) }

    it 'checks if Task is valid' do
      expect(task.valid?).to eq(true)
    end

    it 'checks name uniqueness in the same UserStory' do
      task2 = Task.new
      task2.name = task.name.upcase
      expect(task2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another UserStory' do
      user_story2 = create(:user_story)
      Task.create(name: 'test name', user_story:)
      task2 = Task.create(name: 'test name', user_story: user_story2)
      expect(task2.valid?).to eq(true)
    end

    it 'checks if Task is valid without Sprint' do
      task.sprint = nil
      expect(task.valid?).to eq(true)
    end

    it 'checks if Task is valid without User' do
      task.user = nil
      expect(task.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same UserStory' do
      Task.create(name: 'test name', user_story:, priority: 1)
      task2 = Task.create(name: 'test name2', user_story:, priority: 1)
      expect(task2.valid?).to eq(false)
    end

    it 'checks if task can have the same priority in another UserStory' do
      user_story2 = create(:user_story)
      Task.create(name: 'test name', user_story:, priority: 1)
      task2 = Task.create(name: 'test name2', user_story: user_story2, priority: 1)
      expect(task2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      task.priority = nil
      expect(task.valid?).to eq(true)
    end

    it 'checks if starts_at is less than ends_at' do
      task.starts_at = Date.tomorrow
      task.ends_at = Date.yesterday
      expect(task.valid?).to eq(false)
    end

    it 'checks if starts_at and ends_at can be empty' do
      task.starts_at = nil
      task.ends_at = nil
      expect(task.valid?).to eq(true)
    end

    it 'checks if starts_at can be empty' do
      task.starts_at = nil
      task.ends_at = Date.today
      expect(task.valid?).to eq(true)
    end

    it 'checks if ends_at can be empty' do
      task.starts_at = Date.today
      task.ends_at = nil
      expect(task.valid?).to eq(true)
    end
  end
end
