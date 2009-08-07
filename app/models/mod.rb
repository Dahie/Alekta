class Mod < ActiveRecord::Base
   # class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  belongs_to :original, :class_name => "Mod", :foreign_key => "original_id"
  belongs_to :user
  belongs_to :team
  belongs_to :game
  belongs_to :category
  
  # has_many associations
  has_many :assignments
  has_many :threads
  has_many :reviews
  has_many :releases
  has_many :derivates, :class_name => "Mod", :foreign_key => "original_id"
  has_many :authorships, :dependent => :destroy
  has_many :authors, :through => :authorships
  
  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  
  symbolize :status
  symbolize :origin
  
  
  define_index do
    # fields to index in search engine
    indexes title
    indexes description
    indexes credits
    indexes authors.name, :as => :authors    
  end
  
  # validations
  validates_existence_of      :game,          :allow_nil => false
  validates_presence_of       :original,      :if => :is_derivate? # TODO
  validates_existence_of      :user,          :allow_nil => false
  validates_presence_of       :status
  validates_inclusion_of      :status,        :in => [:pending, :accepted, :rejected]
  validates_presence_of       :website_url
  validates_length_of         :website_url,   :within => 1..100
  validates_presence_of       :title
  validates_length_of         :title,         :within => 1..100
  validates_presence_of       :description
  validates_length_of         :description,   :within => 1..10_000
  validates_presence_of       :credits
  validates_length_of         :credits,       :within => 1..10_000
  
  # attr_accessible
  attr_accessible :status, :game, :description, :credits, :title, :website_url
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  def self.per_page
    5
  end
  
  # public instance methods

  def is_derivate?
    status == :derivate
  end
  
  def has_derivates?
    !derivates.empty?
  end
  
  def has_original?
    !original.nil?
  end

  def is_open?
    status == :open
  end
  
  def pending?
    status == :pending
  end
  
  def accepted?
    status == :accepted
  end
  
  def rejected?
    status == :rejected
  end 
  
  
  protected

  
  # protected class methods
  
  # protected instance methods
  

  
end
