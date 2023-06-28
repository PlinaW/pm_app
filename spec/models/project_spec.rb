require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    let(:project) { create(:project) }

    it 'checks if is valid' do
      expect(project.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      project2 = create(:project)
      project2.name = project.name
      expect(project2.valid?).to eq(false)
    end

    it 'checks if start date is less than end date' do
      project.start_date = Date.tomorrow
      project.end_date = Date.yesterday
      expect(project.valid?).to eq(false)
    end

    it 'checks if start_date can be empty' do
      project.start_date = nil
      project.end_date = Date.today
      expect(project.valid?).to eq(true)
    end

    it 'checks if end_date can be empty' do
      project.start_date = Date.today
      project.end_date = nil
      expect(project.valid?).to eq(true)
    end
  end
end
