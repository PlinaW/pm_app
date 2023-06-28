FactoryBot.define do
  factory :epic do
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    priority { 1 }
    context { 'feature' }
    status { 'pending' }
    project factory: :project
  end
end
