FactoryGirl.define do
    factory :user do
        name Faker::Name.name
        sequence(:email) { |n| "johney#{n}@test.com"}
        password "password"
        password_confirmation "password"
        uid [1 .. 10000].sample
        provider "password"
    end
end
