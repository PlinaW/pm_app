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

  test 'project should not be valid' do
    @project.name = nil
    assert_not @project.valid?
  end

  test 'project name should be unique' do
    @project2.name = 'jak zarobić a się nie narobić'
    @project3.name = 'JAK ZAROBIĆ A SIĘ NIE NAROBIĆ'
    assert_not @project2.valid?
    assert_not @project3.valid?
  end

  test 'project start_date should not be greater than end_date' do
    @project.start_date = Date.tomorrow
    @project.end_date = Date.yesterday
    assert_not @project.valid?
  end

  test 'project can be created without start_date and end_date' do
    @project.start_date = nil
    @project.end_date = nil
    assert @project.valid?
  end
end
