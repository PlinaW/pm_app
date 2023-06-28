require 'rails_helper'

RSpec.describe Sprint, type: :model do
  describe 'validations' do
    let(:sprint) { create(:sprint) }

    it 'checks if Sprint valid' do
      expect(sprint.valid?).to  eq(true)
    end

    it 'checks name uniqueness' do
      sprint2 = Sprint.new
      sprint2.name = sprint.name
      expect(sprint2.valid?).to eq(false)
    end

    it 'checks if start_date is less than end_date' do
      sprint.start_date = Date.tomorrow
      sprint.end_date = Date.yesterday
      expect(sprint.valid?).to eq(false)
    end

    it 'checks if start_date and end_date can be empty' do
      sprint.start_date = nil
      sprint.end_date = nil
      expect(sprint.valid?).to eq(true)
    end

    it 'checks if start_date can be empty' do
      sprint.start_date = nil
      sprint.end_date = Date.today
      expect(sprint.valid?).to eq(true)
    end

    it 'checks if end_date can be empty' do
      sprint.start_date = Date.today
      sprint.end_date = nil
      expect(sprint.valid?).to eq(true)
    end
  end
end
