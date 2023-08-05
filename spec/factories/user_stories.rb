FactoryBot.define do
  factory :user_story do
    association :epic
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    status { 'To do' }
    sequence(:priority) { |n| n }
  end
end
