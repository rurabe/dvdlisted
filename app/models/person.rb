class Person < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :gender, :last_name

  has_many :roles
  has_many :dvds, :through => :roles

  validates_presence_of :first_name, 
  											:gender

  validates_uniqueness_of :first_name, :scope => :last_name
  


  def full_name
  	name = self.first_name
  	name += (" " + self.last_name).to_s if self.last_name
  	name
  end

end
