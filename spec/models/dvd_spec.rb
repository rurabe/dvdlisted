require 'spec_helper'

describe Dvd do
  describe 'validations' do
  	it 'allow valid objects' do
  		FactoryGirl.build(:dvd).should be_valid
  	end

  	it 'require a name' do
  		FactoryGirl.build(:dvd, :name => nil).should_not be_valid
  	end

  	it 'require a summary' do
  		FactoryGirl.build(:dvd, :summary => nil).should_not be_valid
  	end

  	it 'require names to be unique' do
  		FactoryGirl.create(:dvd, :name => "Pulp Fiction")
  		FactoryGirl.build(:dvd, :name => "Pulp Fiction").should_not be_valid
  	end

  end
end
