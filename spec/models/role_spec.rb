require 'spec_helper'

describe Role do
  describe 'validations' do
  	it 'accept valid roles' do
  		FactoryGirl.build(:role).should be_valid
  	end

  	it 'reject invalid role types' do
  		FactoryGirl.build(:role, :role_type => 'producer').should_not be_valid
  	end

  	it 'require dvd_ids' do
  		FactoryGirl.build(:role, :dvd_id => nil).should_not be_valid
  	end

  	it 'require person_ids' do
  		FactoryGirl.build(:role, :person_id => nil).should_not be_valid
  	end

    it 'reject attempts to overwrite the current director' do
      FactoryGirl.create(:role, :dvd_id => 10, :role_type => 'director')
      FactoryGirl.build(:role, :dvd_id => 10, :role_type => 'director').should_not be_valid
    end
  end
end
