# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    username 'username'
    password 'password'
  end
end
