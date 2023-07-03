FactoryBot.define do
  factory :user_story do
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    status { 'To do' }
    priority { 1 }
    epic factory: :epic
  end
end
