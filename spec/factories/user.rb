FactoryGirl.define do
  factory :user, class: User do
    @company = FactoryGirl.create(:company)
    first_name                     'John'
    last_name                      'Doe'
    sequence(:email)               { |n| "john#{n + rand(1..100_000)}@gmail.com" }
    password                       '12345678'
    username                       'Dude'
  end
end
