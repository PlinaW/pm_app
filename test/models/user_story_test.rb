require 'test_helper'

class UserStoryTest < ActiveSupport::TestCase
  def setup
    @user_story = user_stories(:user_story_user_account_project_management)
    @user_story2 = user_stories(:user_story_user_account_project_courier)
    @user_story3 = user_stories(:user_story_data_management_project_management)
  end

  test 'user story should be valid' do
    assert @user_story.valid?
  end

  test 'user story should not be valid without name' do
    @user_story.name = nil
    assert_not @user_story.valid?
  end

  test 'user story name should be unique' do
    @user_story3.name = 'TWORZENIE KONTA UŻYTKOWNIKA'
    assert_not @user_story3.valid?
  end

  # ograniczyłbym to do projektu, ale to chcę sie dopytać
  test 'user story name does not have to be unique to another epic' do
    assert @user_story2.valid?
  end

  test 'user story priority should be unique' do
    @user_story3.priority = 1
    assert_not @user_story3.valid?
  end

  test 'user story priority can be empty' do
    @user_story.priority = nil
    assert @user_story.valid?
  end

  test 'user story priority does not have to be unique to another project' do
    assert @user_story2.valid?
  end
end
