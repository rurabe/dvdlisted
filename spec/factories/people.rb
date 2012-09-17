# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name 				Faker::Name.first_name
    last_name 				Faker::Name.last_name
    date_of_birth 		(Random.rand(10_000)+10_000).days.ago
    gender 						["m","f"][Random.rand(2)]
  end
end
