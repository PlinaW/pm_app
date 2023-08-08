require 'rails_helper'

RSpec.describe Epic, type: :model do
  describe 'validations' do
    let(:project1) { create(:project) }
    let(:project2) { create(:project) }
    let(:epic1) { create(:epic, project: project1) }
    let(:epic2) { create(:epic, project: project1) }

    it 'checks if Epic is valid' do
      expect(epic1.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      epic2.name = epic1.name.upcase
      expect(epic2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another project' do
      epic2.project = project2
      epic2.name = epic1.name
      expect(epic2.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same project' do
      epic2.priority = epic1.priority
      expect(epic2.valid?).to eq(false)
    end

    it 'checks if epic can have the same priority in another project' do
      epic2.project = project2
      epic2.priority = epic1.priority
      expect(epic2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      epic1.priority = nil
      expect(epic1.valid?).to eq(true)
    end
  end
end
