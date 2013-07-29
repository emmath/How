class Step < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :description
  validates :description, presence: true
end
