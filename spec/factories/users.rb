# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name ""
    lastname ""
    email "MyString"
    email ""
    role ""
    client_id ""
    analyst_id 1
  end
end
