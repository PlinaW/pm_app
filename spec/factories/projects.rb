FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "test name#{n}" }
    description { 'test description' }
    status { 'pending' }
    start_date { Date.today }
    end_date { Date.today + 6.months }
  end
end
