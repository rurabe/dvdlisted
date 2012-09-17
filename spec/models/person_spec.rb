require 'spec_helper'

describe Person do
  describe 'validations' do

  	it 'should allow valid people' do
  		FactoryGirl.build(:person).should be_valid
  	end

  	it 'should require at least a first name' do
  		FactoryGirl.build(:person, :first_name => nil).should_not be_valid
  	end


  end
end
