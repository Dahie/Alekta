class User < ActiveRecord::Base
  
  # class attributes
  
  # named_scopes
  
  # instance attributes
  
  # belongs_to associations
  belongs_to :team
  
  # has_many associations
  has_many :reviews
  has_many :comments
  has_many :memberships
  has_many :teams
  has_many :games
  has_many :mirrors
  has_many :releases
  has_many :threads
  has_many :downloads
  
  # has_one associations
  
  # composed_of mappings
  
  # plugins/config
  acts_as_authentic :login_field => :email
  symbolize :role
  symbolize :gender
  
  # validations
  validates_presence_of         :real_name
  validates_length_of           :real_name,                 :within => 1..100
  validates_presence_of         :nick_name
  validates_length_of           :nick_name,                 :within => 1..100
  validates_uniqueness_of       :nickname,                  :case_sensitive => false
  validates_inclusion_of        :gender,                    :in => [:unknown, :male, :female]
  validates_presence_of         :email
  validates_length_of           :email,                     :within => 6..100
  validates_uniqueness_of       :email,                     :case_sensitive => false
  validates_presence_of         :role
  validates_inclusion_of        :role,                      :in => [:user, :admin, :expert, :modder, :moderator, :observer]  
  
  # attr_accessible
  
  # before callbacks
  
  # after callbacks
  
  # public class methods
  
  # def deliver_password_reset_instructions!
  #    reset_perishable_token!
  #    Notifier.deliver_password_reset_instructions(self)
  # end
  
  # name
  
  # public instance methods
  
  def is_admin?
    role == :admin
  end
  
  def is_editor?
    role == :editor
  end
  
  def is_moderator?
    role == :moderator
  end
  
  def is_modder?
    role == :modder
  end
  
  def is_expert?
    role == :expert
  end
  
  def is_observer?
    role == :observer
  end
  
  
  protected
  
  # protected class methods
  
  # protected instance methods  

end

