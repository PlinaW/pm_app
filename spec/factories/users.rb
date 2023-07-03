FactoryBot.define do
  factory :user do
    first_name { 'Test first_name' }
    last_name { 'Test last_name' }
    email { 'test@example.com' }
    password { 'password' }
  end
end
