# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username 'username'
    password 'password'
    role :user

    trait :admin do
      role :admin
    end
  end
end
