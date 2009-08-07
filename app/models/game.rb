class Game < ActiveRecord::Base
  # class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  
  belongs_to :user
  
  # has_many associations

  has_many :media
  has_many :mods
  has_many :teams
  has_many :releases

  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  
  symbolize :template_name, :layout_name, :style_name
  
  # validations
  
  validates_presence_of   :name
  validates_length_of     :name,     :within => 1..100
  validates_uniqueness_of :name,     :case_sensitive => false
  validates_presence_of   :alias
  validates_length_of     :alias,     :within => 1..100
  validates_uniqueness_of :alias,     :case_sensitive => false
  validates_presence_of   :url
  validates_length_of     :url, :within => 1..100
  validates_format_of     :url, :with => //
  validates_uniqueness_of :url, :case_sensitive => false
  
  # attr_accessible
  
  attr_accessible :name, :url, :alias
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  # public instance methods
  
  protected
  
  # protected class methods
  
  
  # protected instance methods
end
