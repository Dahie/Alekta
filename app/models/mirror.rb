class Mirror < ActiveRecord::Base

  # class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  belongs_to :user
  belongs_to :release
  
  # has_many associations

  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  
  symbolize :status
  
  
  # validations
  validates_existence_of      :release,       :allow_nil => false
  validates_existence_of      :user,          :allow_nil => false
  
  validates_presence_of       :status
  validates_inclusion_of      :status,        :in => [:private, :public]
  
  validates_presence_of       :title
  validates_length_of         :title,         :within => 1..100
  
  validates_presence_of       :download_url
  validates_length_of         :download_url,  :within => 1..100
  
  # attr_accessible
  attr_accessible :status, :download_url, :title
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  # public instance methods
  
  # protected
  
  # protected class methods
  
  # protected instance methods
 
end
