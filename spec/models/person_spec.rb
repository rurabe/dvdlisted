require 'spec_helper'

describe Person do
  describe 'validations' do

  	it 'allow valid people' do
  		FactoryGirl.build(:person).should be_valid
  	end

  	it 'require at least a first name' do
  		FactoryGirl.build(:person, :first_name => nil).should_not be_valid
  	end

  	it 'require a gender' do
  		FactoryGirl.build(:person, :gender => nil).should_not be_valid
  	end

  	it 'require name combinations to be unique' do
  		FactoryGirl.create(:person, 
  											 :first_name => "Clint", 
  											 :last_name => "Eastwood")

  		FactoryGirl.build(:person, 
  											:first_name => "Clint", 
  											:last_name => "Eastwood").should_not be_valid

  		FactoryGirl.build(:person, 
  											:first_name => "Clint", 
  											:last_name => "Northwood").should be_valid
  	end
  end

  describe '#full_name' do
  	it "returns the person's full name" do
  		@actor = FactoryGirl.build(:person)
  		expected_full_name = @actor.first_name
  		expected_full_name += ( " " + @actor.last_name).to_s if !@actor.last_name.blank?
  		@actor.full_name.should == expected_full_name
  	end
  end

end
