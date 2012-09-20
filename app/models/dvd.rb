class Dvd < ActiveRecord::Base
  attr_accessible :asin, :name, :release_date, :summary, :picture

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

  before_save :set_picture

  def set_picture
    if self.asin_changed? && !self.asin.blank?
      response = Amazon::Ecs.item_search( asin, 
                                          :search_index => 'DVD',
                                          :response_group => 'Images')
      puts response.first_item

      image_info = response.first_item.get('LargeImage')

      self.picture = Nokogiri::XML(image_info).first_element_child.content
    end
  end

end
