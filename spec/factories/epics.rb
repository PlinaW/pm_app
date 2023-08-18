FactoryBot.define do
  factory :epic do
    association :project
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    status { 'pending' }
  end
end
