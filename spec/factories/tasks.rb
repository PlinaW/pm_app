FactoryBot.define do
  factory :task do
    association :user_story
    association :sprint
    association :user
    sequence(:name) { |n| "test name #{n}" }
    description { 'Test description' }
    status { 'To do' }
    sequence(:priority) { |n| n }
    starts_at { Date.today }
    ends_at { Date.tomorrow }
  end
end
