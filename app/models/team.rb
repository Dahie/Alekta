class Team < ActiveRecord::Base
  
  
  # class attributes

  # named_scopes

  # instance attributes

  # belongs_to associations

  # has_many associations
  has_many :mods
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships

  # has_one associations

  # composed_of mappings

  # plugins/config
  
  symbolize :status
  
  # validations
  validates_presence_of   :name
  validates_length_of     :name,          :within => 1..255,     :allow_blank => false
  validates_presence_of   :description
  validates_length_of     :description,   :within => 0..10000,   :allow_blank => true
  validates_presence_of   :website_url
  validates_length_of     :website_url,   :within => 0..10000,   :allow_blank => true
  validates_presence_of   :email
  validates_length_of     :email,         :within => 1..255,     :allow_blank => false
  
  # attr_accessible
  attr_accessible :name, :description, :email, :website_url

  # before callbacks

  # after callbacks

  # public class methods

  # public instance methods

  # protected

  # protected class methods

  # protected instance methods
  
end
