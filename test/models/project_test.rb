require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = projects(:project_management)
    @project2 = projects(:project_courier)
    @project3 = projects(:project_doctor)
  end

  test 'project should be valid' do
    assert @project.valid?
  end

  test 'project name should be unique' do
    @project.update(name: 'Example name')
    @project2.name = 'Example name'
    @project3.name = 'EXAMPLE nAmE'
    assert @project.valid?
    assert_not @project2.valid?
    assert_not @project3.valid?
  end

  test 'project start_date should not be greater than end_date' do
    @project.update(start_date: Date.tomorrow)
    @project.update(end_date: Date.yesterday)
    assert_not @project.valid?
  end

end
