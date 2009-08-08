class Release < ActiveRecord::Base
  
  # class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  belongs_to :mod
  belongs_to :user
  
  # has_many associations

  has_many :mirrors
  
  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  
  symbolize :status
  
  
  # validations
  validates_existence_of      :mod,           :allow_nil => false
  validates_existence_of      :user,          :allow_nil => false
  
  validates_presence_of       :status
  validates_inclusion_of      :status,        :in => [:private, :public]
  
  validates_presence_of       :title
  validates_length_of         :title,         :within => 1..100
  
  validates_presence_of       :version
  validates_length_of         :version,       :within => 1..100
  
  validates_presence_of       :change_log
  validates_length_of         :change_log,    :within => 1..10_000
  
  # attr_accessible
  attr_accessible :status, :text, :title, :version, :change_log, :mirrors
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  # public instance methods
  
  # protected
  
  # protected class methods
  
  # protected instance methods
 

end
