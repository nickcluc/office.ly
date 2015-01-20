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
    weekly_rate 100

    listing_type
    user
  end

  factory :review do
    rating 5
    comment "I really liked this office, the coffee machine really is sweet!"
  end

  factory :reservation do
    start_date "05/03/2015"
    end_date "12/03/2015"
  end

  factory :listing_type do
    title "Single Desk"
    description "Single Desk Available"
  end

  factory :amenity do
    name "Coffee"
    description "sfhjdsg"
    font_awesome_image "shfjs"
  end
end
