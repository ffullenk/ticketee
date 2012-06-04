class Project < ActiveRecord::Base
  extend FriendlyId
  validates :name, :presence => true
  has_many :tickets
  
  
  friendly_id :name, use: :slugged
end
