class Idea < ActiveRecord::Base
  validates :title,
    presence: true,
    uniqueness: true
    
  belongs_to :status
  belongs_to :customer
  belongs_to :category
  has_many :votes
end
