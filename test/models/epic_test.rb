require 'test_helper'

class EpicTest < ActiveSupport::TestCase
  def setup
    @epic = epics(:epic_register_project_management)
    @epic2 = epics(:epic_register_project_courier)
    @epic3 = epics(:epic_login_project_management)
    @project = projects(:project_management)
  end

  test 'epic should be valid' do
    assert @epic.valid?
  end

  test 'epic should not be valid without name' do
    @epic.name = nil
    assert_not @epic.valid?
  end

  test 'epic name should be unique' do
    @epic3.name = 'FUNKCJONALNOŚĆ REJESTRACJI NOWYCH UŻYTKOWNIKÓW'
    assert_not @epic3.valid?
  end

  test 'epic name does not have to be unique to another project' do
    assert @epic2.valid?
  end

  test 'epic priority should be unique' do
    @epic3.priority = 1
    assert_not @epic3.valid?
  end

  test 'epic priority can be empty' do
    @epic.priority = nil
    assert @epic.valid?
  end

  test 'epic priority does not have to be unique to another project' do
    assert @epic2.valid?
  end
end
