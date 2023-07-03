FactoryBot.define do
  factory :sprint do
    sequence(:name) { |n| "test name#{n}" }
    goal { 'Test goal' }
    start_date { Date.today }
    end_date { Date.today + 4.weeks }
  end
end
