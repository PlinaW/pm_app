FactoryBot.define do
  factory :issue do
    association :epic
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    status { 'To do' }
    sequence(:priority) { |n| n }
  end
end
