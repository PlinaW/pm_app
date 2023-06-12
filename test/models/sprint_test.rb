require 'test_helper'

class SprintTest < ActiveSupport::TestCase
  def setup
    @sprint = sprints(:app_access)
    @sprint2 = sprints(:search_courier)
  end

  test 'sprint should be valid' do
    assert @sprint.valid?
  end

  test 'sprint should not be valid without name' do
    @sprint.name = nil
    assert_not @sprint.valid?
  end

  test 'sprint name should be unique' do
    @sprint2.name = 'UMOŻLIWIENIE DOSTĘPU DO APKI'
    assert_not @sprint2.valid?
  end

  test 'sprint start_date should not be greater than end_date' do
    @sprint.start_date = Date.tomorrow
    @sprint.end_date = Date.yesterday
    assert_not @sprint.valid?
  end

  test 'sprint can be created without start_date and end_date' do
    @sprint.start_date = nil
    @sprint.end_date = nil
    assert @sprint.valid?
  end
end
