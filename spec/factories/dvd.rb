FactoryGirl.define do
	factory :dvd do
		name 					{ Faker::HipsterIpsum.words.join(" ").titlecase }
		release_date 	{ Random.rand(10_000).days.ago.to_date }
		summary 			{ Faker::HipsterIpsum.words(40).join(" ") }
		asin 					{ Random.rand(9999999999).to_s.rjust(10,"0") }

	end	
end