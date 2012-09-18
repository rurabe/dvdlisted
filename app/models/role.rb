class Role < ActiveRecord::Base
  belongs_to :dvd
  belongs_to :person

  attr_accessible :person_id, :dvd_id, :role_type

  validates :role_type, :inclusion => { :in => ['actor','director'] }
  validates_presence_of :dvd_id, :person_id
  validates_uniqueness_of :role_type, :scope => :dvd_id, :if => Proc.new { |role| role.role_type == 'director'}
  validates_uniqueness_of :person_id, :scope => [:dvd_id,:role_type]

end
