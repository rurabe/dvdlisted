require 'spec_helper'

describe Person do

	describe '#new' do
		context 'as an actor' do
			before :each do
				visit new_actor_path
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

			it 'denotes that it this is for a new actor' do
				page.should have_content('New actor')
			end
		end

		context 'as an director' do
			before :each do
				visit new_director_path
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

			it 'denotes that it this is for a new actor' do
				page.should have_content('New director')
			end
		end

	end

	describe '#show' do
		context 'as an actor' do
			before :each do
				@person = FactoryGirl.create(:person)
				visit actor_path(@person)
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
				page.should have_button('Edit actor')
			end

			it 'has a delete button' do
				page.should have_button('Delete actor')
			end
		end

		context 'as a director' do
			before :each do
				@person = FactoryGirl.create(:person)
				visit director_path(@person)
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
				page.should have_button('Edit director')
			end

			it 'has a delete button' do
				page.should have_button('Delete director')
			end
		end
	end

	describe '#edit' do
		context 'as an actor' do
			before :each do
				@person = FactoryGirl.create(:person)
				visit edit_actor_path(@person)
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

			it 'denotes that it this is for updating an actor' do
				page.should have_content('Update actor')
			end

		end

		context 'as a director' do
			before :each do
				@person = FactoryGirl.create(:person)
				visit edit_director_path(@person)
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

			it 'denotes that it this is for updating an actor' do
				page.should have_content('Update director')
			end

		end
	end

end