class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :add_role
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :buildings
  has_and_belongs_to_many :roles
  
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:role_id
  
  def add_role
	role = Role.find(self.role_id);
	self.roles.push role
  end
end
