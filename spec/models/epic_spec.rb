require 'rails_helper'

RSpec.describe Epic, type: :model do
  describe 'validations' do
    let(:epic) { create(:epic) }
    let(:project) { create(:project) }

    it 'checks if Epic is valid' do
      expect(epic.valid?).to eq(true)
    end

    it 'checks uniqueness of name' do
      epic2 = Epic.new
      epic2.name = epic.name.upcase
      expect(epic2.valid?).to eq(false)
    end

    it 'checks if name can be the same in another project' do
      project2 = create(:project)
      Epic.create(name: 'test name', project:)
      epic2 = Epic.create(name: 'test name', project: project2)
      expect(epic2.valid?).to eq(true)
    end

    it 'checks priority uniquess in the same project' do
      Epic.create(name: 'test name', project:, priority: 1)
      epic2 = Epic.create(name: 'test name2', project:, priority: 1)
      expect(epic2.valid?).to eq(false)
    end

    it 'checks if epic can have the same priority in another project' do
      project2 = create(:project)
      Epic.create(name: 'test name', project:, priority: 1)
      epic2 = Epic.create(name: 'test name2', project: project2, priority: 1)
      expect(epic2.valid?).to eq(true)
    end

    it 'checks if priority can be empty' do
      epic.priority = nil
      expect(epic.valid?).to eq(true)
    end
  end
end
