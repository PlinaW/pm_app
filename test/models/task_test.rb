require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = tasks(:task_form_project_management)
    @task2 = tasks(:task_form_project_courier)
    @task3 = tasks(:task_user_panel_project_management)
  end

  test 'task should be valid' do
    assert @task.valid?
  end

  test 'task should not be valid without name' do
    @task.name = nil
    assert_not @task.valid?
  end

  test 'task name should be unique' do
    @task3.name = 'UTWORZENIE FORMULARZA REJESTRACJI'
    assert_not @task3.valid?
  end

  # tu tak samo powinno być chyba w obrębie projektu,
  # trzeba będzie pomyśleć jak przypisać project_id do scope
  test 'task name does not have to be unique to another user story' do
    assert @task2.valid?
  end

  test 'task should be valid without sprint' do
    @task.sprint = nil
    assert @task.valid?
  end

  test 'task should be valid without user' do
    @task.user = nil
    assert @task.valid?
  end

  test 'task priority should be unique' do
    @task3.priority = 1
    assert_not @task3.valid?
  end

  test 'task should be valid without priority' do
    @task.priority = nil
    assert @task3.valid?
  end

  test 'task priority does not have to be unique to another user story' do
    assert @task2.valid?
  end

  test 'task ends_at should not be less than starts_at' do
    @task.starts_at = Date.tomorrow
    @task.ends_at = Date.yesterday
    assert_not @task.valid?
  end

  test 'task can be created without starts_at and ends_at' do
    @task.starts_at = nil
    @task.ends_at = nil
    assert @task.valid?
  end
end
