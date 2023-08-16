FactoryBot.define do
  factory :epic do
    association :project
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    sequence(:priority) { |n| n }
    status { 'pending' }
  end
end
