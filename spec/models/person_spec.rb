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
  											 :first_name => "Naruto", 
  											 :last_name => "Uzumaki")

  		FactoryGirl.build(:person, 
  											:first_name => "Naruto", 
  											:last_name => "Uzumaki").should_not be_valid

  		FactoryGirl.build(:person, 
  											:first_name => "Kushina", 
  											:last_name => "Uzumaki").should be_valid
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

  describe '#self.actors' do
    it 'returns all the actors in the system' do
      factory_actors = []
      2.times do |i|
        cast = FactoryGirl.create_list(:person, 3)
        dvd = FactoryGirl.create(:dvd)
        cast.each do |actor|
          FactoryGirl.create(:role, :person_id => actor.id, :dvd_id => dvd.id, :role_type => 'actor')
          factory_actors << actor
        end
      end
      all_actors = Person.actors
      factory_actors.each do |actor|
        all_actors.should include actor
      end
    end
  end

  describe '#self.directors' do
    it 'returns all the directors in the system' do
      factory_directors = []
      3.times do |i|
        director = FactoryGirl.create(:person)
        dvd = FactoryGirl.create(:dvd)
        FactoryGirl.create(:role, :person_id => director.id, :dvd_id => dvd.id, :role_type => 'director')
        factory_directors << director
      end
      all_directors = Person.director
      factory_directors.each do |director|
        all_directors.should include director
      end
    end
  end

end
