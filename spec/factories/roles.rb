# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    role_type "MyString"
    dvd nil
    person nil
  end
end
