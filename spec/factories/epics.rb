FactoryBot.define do
  factory :epic do
    association :project
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    sequence(:priority) { |n| n }
    context { 'feature' }
    status { 'pending' }
  end
end
