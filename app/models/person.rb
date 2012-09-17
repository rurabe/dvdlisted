class Person < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :gender, :last_name

  validates :first_name,			:presence => true
end
