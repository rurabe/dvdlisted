require 'spec_helper'

describe Dvd do

	describe '#index' do
		it 'has a button to add a new DVD' do
			visit dvds_path
			page.should have_button("Add a DVD")
		end

		it 'displays the titles of the DVDs' do
			FactoryGirl.create(:dvd, :name => 'Naruto')
			visit dvds_path
			page.should have_link("Naruto")
		end
	end

	describe '#new' do
		before :each do
			visit new_dvd_path
		end

		it 'has a name field' do
			page.should have_field('dvd[name]')
		end

		it 'has a summary field' do
			page.should have_field('dvd[summary]')
		end

		it 'has a release date field' do
			page.should have_field('dvd[release_date(1i)]')
		end

		it 'has an Amazon ID field' do
			page.should have_field('dvd[asin]')
		end 
	end

	describe '#create' do
		it 'creates a new dvd' do
			visit new_dvd_path
			fill_in 'dvd[name]', :with => 'Naruto'
			fill_in 'dvd[summary]', :with => 'Ninjas!'
			expect { click_button 'Create Dvd' }.to change(Dvd, :count).by(1)
		end
	end

	describe '#show' do
		before :each do
			@dvd = FactoryGirl.create(:dvd)
			visit dvd_path(@dvd)
		end

		it 'displays the name' do
			page.should have_content(@dvd.name)
		end

		it 'displays the summary' do
			page.should have_content(@dvd.summary)
		end

		it 'displays the release date' do
			page.should have_content(@dvd.release_date)
		end

		it 'displays the Amazon ID' do
			page.should have_content(@dvd.asin)
		end

		it 'has an edit button' do
			page.should have_button('Edit DVD')
		end

		it 'has a delete button' do
			page.should have_button('Delete DVD')
		end

		it 'displays the actors in the dvd' do
			cast = FactoryGirl.create_list(:person, 3)
			cast.each do |actor|
				FactoryGirl.create(:role, :person_id => actor.id, :dvd_id => @dvd.id, :role_type => 'actor')
			end
			visit dvd_path(@dvd)
			cast.each do |actor|
				page.should have_link(actor.full_name)
			end
		end
	end

	describe '#edit' do
		before :each do
			@dvd = FactoryGirl.create(:dvd)
			visit edit_dvd_path(@dvd)
		end

		it 'has a field with the current name' do
			find_field('dvd[name]').value.should == @dvd.name
		end

		it 'has a field with the current summary' do
			find_field('dvd[summary]').value.gsub("\n","").should == @dvd.summary
		end

		it 'has a field with the current release_date' do
			find_field('dvd[release_date(1i)]').value.should == @dvd.release_date.year.to_s
		end

		it 'has a field with the current Amazon ID' do
			find_field('dvd[asin]').value.should == @dvd.asin
		end

	end

	describe '#update' do
		before :each do
			@dvd = FactoryGirl.create(:dvd)
		end
		it 'changes the attributes' do
			visit edit_dvd_path(@dvd)
			fill_in 'dvd[name]', :with => 'Naruto'
			click_button 'Update Dvd'
			page.should have_content 'Naruto'
		end
	end

	describe '#destroy' do
		before :each do
			@dvd = FactoryGirl.create(:dvd)
		end

		it 'destroys the dvd' do
			expect { page.driver.submit :delete, dvd_path(@dvd), {} }.to change(Dvd, :count).by(-1)
		end
	end
end