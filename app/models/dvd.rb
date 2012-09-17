class Dvd < ActiveRecord::Base
  attr_accessible :asin, :name, :release_date, :summary

  has_many :roles
  has_many :actors,				:through => :roles, 
  												:source => :person, 
  												:conditions => "roles.role_type = 'actor'"
  has_one :director_role,	:class_name => 'Role',
  												:conditions => "roles.role_type = 'director'"
  has_one	:director,			:through => :director_role, :source => :person

  validates :name,			:presence => true,
  								 			:uniqueness => {:case_sensitive => false }
  validates :summary,		:presence => true

end
