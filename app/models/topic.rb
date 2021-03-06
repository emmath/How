class Topic < ActiveRecord::Base
  attr_accessible :subject
  validates :subject, :presence => true
  has_many :steps, dependent: :delete_all
end
