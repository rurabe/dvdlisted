FactoryGirl.define do
	factory :dvd do
		name 					Faker::HipsterIpsum.words.join(" ").titlecase
		release_date 	Date.today
		summary 			Faker::HipsterIpsum.words(40).join(" ")
		asin 					Random.new.rand(9999999999).to_s.rjust(10,"0")
	end	
end