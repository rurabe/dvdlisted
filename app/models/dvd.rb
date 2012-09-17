class Dvd < ActiveRecord::Base
  attr_accessible :asin, :name, :release_date, :summary

  has_many :roles
  has_many :people, :through => :roles

  validates :name,			:presence => true,
  								 			:uniqueness => {:case_sensitive => false }
  validates :summary,		:presence => true

end
