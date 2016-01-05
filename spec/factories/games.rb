FactoryGirl.define do
  factory :game do
    sequence(:name)  { |n| "name#{n}" }
    sequence(:description)  { |n| "description#{n}" }
    user
  end
end
