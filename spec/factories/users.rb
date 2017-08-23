# FactoryGirl.define do
#   factory :user, class: User do
#     @user = FactoryGirl.create(:user)
    # first_name                     'John'
    # last_name                      'Doe'
    # sequence(:email)               { |n| "john#{n + rand(1..100_000)}@gmail.com" }
    # password                       '12345678'
    # username                       'Dude'
#   end
# end

# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name                     'John'
    last_name                      'Doe'
    sequence(:email)               { |n| "john#{n + rand(1..100_000)}@gmail.com" }
    password                       '12345678'
    username                       'Dude'
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
