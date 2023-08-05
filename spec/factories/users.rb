FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "test first_name #{n}" }
    sequence(:last_name) { |n| "test last_name #{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
  end
end
