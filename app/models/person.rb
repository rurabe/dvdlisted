class Person < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :gender, :last_name

  has_many :roles,              :dependent => :destroy
  has_many :dvds_as_an_actor,   :through => :roles, :conditions => "roles.role_type = 'actor'",
                                :source => :dvd,
                                :order => :name
  has_many :dvds_as_a_director, :through => :roles, :conditions => "roles.role_type = 'director'",
                                :source => :dvd,
                                :order => :name

  validates_presence_of :first_name, 
  											:gender

  validates_uniqueness_of :first_name, :scope => :last_name
  


  def full_name
  	name = self.first_name
  	name += (" " + self.last_name).to_s if self.last_name
  	name
  end

  def self.actors
    self.joins(:roles).where("roles.role_type" => "actor").order(:first_name).uniq
  end

  def self.director
    self.joins(:roles).where("roles.role_type" => "director").order(:first_name).uniq
  end

end
