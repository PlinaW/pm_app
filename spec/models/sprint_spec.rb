require 'rails_helper'

RSpec.describe Sprint, type: :model do
  describe 'validations' do
    let(:sprint1) { create(:sprint) }
    let(:sprint2) { create(:sprint) }

    it 'checks if Sprint valid' do
      expect(sprint1.valid?).to eq(true)
    end

    it 'checks name uniqueness' do
      sprint2.name = sprint1.name
      expect(sprint2.valid?).to eq(false)
    end

    it 'checks if start_date is less than end_date' do
      sprint1.start_date = Date.tomorrow
      sprint1.end_date = Date.yesterday
      expect(sprint1.valid?).to eq(false)
    end

    it 'checks if start_date and end_date can be empty' do
      sprint1.start_date = nil
      sprint1.end_date = nil
      expect(sprint1.valid?).to eq(true)
    end

    it 'checks if start_date can be empty' do
      sprint1.start_date = nil
      sprint1.end_date = Date.today
      expect(sprint1.valid?).to eq(true)
    end

    it 'checks if end_date can be empty' do
      sprint1.start_date = Date.today
      sprint1.end_date = nil
      expect(sprint1.valid?).to eq(true)
    end
  end
end
