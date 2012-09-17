require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the DvdsHelper. For example:
#
# describe DvdsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe DvdsHelper do

	describe '#amazon_link' do
		it 'should output the correct link' do
			@dvd = FactoryGirl.create(:dvd)
			expected_link = 'http://www.amazon.com/dp/' + @dvd.asin
			amazon_link(@dvd).should == expected_link
		end
	end

end
