class Role < ActiveRecord::Base
  belongs_to :dvd
  belongs_to :person

  attr_accessible :person_id, :dvd_id, :role_type
end
