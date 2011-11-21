class Building < ActiveRecord::Base
  belongs_to :user
  has_many :floors
end
