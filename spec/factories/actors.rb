# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    first_name "MyString"
    last_name "MyString"
    date_of_birth "2012-09-16"
    gender "MyString"
  end
end
