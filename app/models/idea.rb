class Idea < ActiveRecord::Base
  validates :title,
    presence: true,
    uniqueness: true
  validates :status_id, :category_id, :customer_id,
    presence: true

  belongs_to :status
  belongs_to :customer
  belongs_to :category
  has_many :votes
end
