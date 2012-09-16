class Dvd < ActiveRecord::Base
  attr_accessible :asin, :name, :release_date, :summary

  validates :name, :presence => true,
  								 :uniqueness => {:case_sensitive => false }
  validates :summary, :presence => true

end
