FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "user#{n}@example.com" }
    sequence(:firstname)  { |n| "Firstname#{n}" }
    sequence(:lastname)   { |n| "LastName#{n}" }
    auth_token SecureRandom.hex(User::TOKEN_LENGTH)
  end
end
