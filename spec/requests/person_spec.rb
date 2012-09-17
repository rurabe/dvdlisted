require 'spec_helper'

describe Person do

	describe '#new' do
		before :each do
			visit new_person_path
		end

		it 'has a first name field' do
			page.should have_field('person[first_name]')
		end

		it 'has a last name field' do
			page.should have_field('person[last_name]')
		end

		it 'has a date of birth field' do
			page.should have_field('person[date_of_birth(1i)]')
		end

		it 'has a gender field' do
			page.should have_field('person[gender]')
		end
	end

	describe '#show' do
		before :each do
			@person = FactoryGirl.create(:person)
			visit person_path(@person)
		end

		it "displays the person's name" do
			page.should have_content(@person.full_name)
		end

		it 'displays the birthday' do
			page.should have_content(@person.date_of_birth)
		end

		it 'displays the gender' do
			page.should have_content(@person.gender)
		end

		it 'has an edit button' do
			page.should have_button('Edit person')
		end

		it 'has a delete button' do
			page.should have_button('Delete person')
		end
	end

	describe '#edit' do
		before :each do
			@person = FactoryGirl.create(:person)
			visit edit_person_path(@person)
		end

		it 'has a field with the current first name' do
			find_field('person[first_name]').value.should == @person.first_name
		end

		it 'has a field with the current last name' do
			find_field('person[last_name]').value.should == @person.last_name
		end

		it 'has a field with the current date of birth' do
			find_field('person[date_of_birth(1i)]').value.should == @person.date_of_birth.year.to_s
		end

		it 'has a field with the current gender' do
			find_field('person[gender]').value.should == @person.gender
		end

	end

end