FactoryBot.define do
  factory :task do
    user_story factory: :user_story
    sprint factory: :sprint
    user factory: :user
    sequence(:name) { |n| "test name#{n}" }
    description { 'Test description' }
    status { 'To do' }
    priority { 1 }
    starts_at { Date.today }
    ends_at { Date.tomorrow }
  end
end
