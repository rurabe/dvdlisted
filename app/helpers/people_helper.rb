module PeopleHelper
	def age(birthday)
		time_ago_in_words(birthday).gsub("about ","") + " old"
	end
end
