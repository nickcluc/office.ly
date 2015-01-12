require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :listing do
    title 'Desk @ Launch Academy'
    description 'Great Seat Near The Coffee Machine!!!'
    address '33 Harrison Ave. Suite 501'
    city 'Boston'
    state 'MA'
    zip_code '02111'
    rate_cents 100

    user
  end

  factory :review do
    rating 5
    comment "I really liked this office, the coffee machine really is sweet!"
  end
end
