# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    role_type 	{ ["actor","director"][Random.rand(2)] }
    dvd_id 			{ Random.rand(100) }
    person_id 	{ Random.rand(100) }
  end
end
