class Review < ActiveRecord::Base
  
  # class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  
  belongs_to :mod
	belongs_to :user
  
  # has_many associations
  
  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  
  # validations

	validates_presence_of   :title
  validates_length_of     :title,  :within => 1..100,     :allow_blank => false
	validates_length_of     :text,   :within => 0..10_000,   :allow_blank => true
	
	validates_existence_of  :user,  :allow_nil => false
  validates_existence_of  :organisation,  :allow_nil => false
  
  # attr_accessible
  
  attr_accessible :title, :text, :url, :alias
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  # public instance methods
  
  protected
  
  # protected class methods
  
  # protected instance methods 
	
	
  
end
