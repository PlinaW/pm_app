require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'validations' do
    let(:epic1) { create(:epic) }
    let(:epic2) { create(:epic) }
    let(:issue1) { create(:issue, epic: epic1) }
    let(:issue2) { create(:issue, epic: epic1) }

    it 'checks if Issue is valid' do
      expect(issue1.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      issue2.name = issue1.name
      expect(issue2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another epic' do
      issue2.epic = epic2
      issue2.name = issue1.name
      expect(issue2.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same epic' do
      issue2.priority = issue1.priority
      expect(issue2.valid?).to eq(false)
    end

    it 'checks if Issue can have the same priority in another Epic' do
      issue2.epic = epic2
      issue2.priority = issue1.priority
      expect(issue2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      issue1.priority = nil
      expect(issue1.valid?).to eq(true)
    end
  end
end
