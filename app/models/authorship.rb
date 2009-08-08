class Authorship < ActiveRecord::Base
 	
	# class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  
  belongs_to :mod
	belongs_to :team
  
  # has_many associations
  
  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  
  # validations

	validates_existence_of :mod,      :allow_nil => false
	validates_existence_of :team,      :allow_nil => false
  
  # attr_accessible
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  # public instance methods
  
  protected
  
  # protected class methods
  
  # protected instance methods 
	

end
