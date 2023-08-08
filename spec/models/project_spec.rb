require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    let(:project1) { create(:project) }
    let(:project2) { build(:project) }

    it 'checks if is valid' do
      expect(project1.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      project2.name = project1.name
      expect(project2.valid?).to eq(false)
    end

    it 'checks if start date is less than end date' do
      project1.start_date = Date.tomorrow
      project1.end_date = Date.yesterday
      expect(project1.valid?).to eq(false)
    end

    it 'checks if start_date can be empty' do
      project1.start_date = nil
      project1.end_date = Date.today
      expect(project1.valid?).to eq(true)
    end

    it 'checks if end_date can be empty' do
      project1.start_date = Date.today
      project1.end_date = nil
      expect(project1.valid?).to eq(true)
    end
  end
end
